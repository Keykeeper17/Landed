extends Node2D

var dragging = false
var selected = []  # Array of selected units.
var drag_start = Vector2.ZERO
var select_rect = RectangleShape2D.new()

var drag_end = Vector2()

var units = []

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			if selected.size() == 0:
				dragging = true
				drag_start = get_global_mouse_position()
	#			print(event.position)
			else:
				for item in selected:
					if(item.collider_id == 1242 or item.collider_id == 1262 or item.collider_id == 1252 or item.collider_id == 1257 or item.collider_id == 1247):
						item.collider.target = get_global_mouse_position()
						item.collider.selected = false
					else:
						pass
				selected = []
				
		elif dragging:
			dragging = false
			update() #Updates the node's visual representation
			
			#Define shape
			drag_end = get_global_mouse_position()
			select_rect.extents = (drag_end - drag_start) / 2
#			print(drag_start)
#			print(drag_end)
#			print(select_rect.extents)
			
			var space = get_world_2d().direct_space_state
			var query = Physics2DShapeQueryParameters.new()
			query.set_shape(select_rect)
			query.transform = Transform2D(0, (drag_end + drag_start) / 2)
			selected = space.intersect_shape(query)
#			print(selected)
			
#			print(selected.collider)
			
			for item in selected:
#				print("Test: ",item.collider_id)
				if(item.collider_id == 1242 or item.collider_id == 1262 or item.collider_id == 1252 or item.collider_id == 1257 or item.collider_id == 1247):
					item.collider.selected = true
				else:
					pass
			
			
	if event is InputEventMouseMotion and dragging:
		drag_end = get_global_mouse_position()
		update()
		
func _draw():
	if dragging:
#		print("S: ",drag_start)
#		print(drag_end)
#		print("VP: ",drag_end - drag_start)
		draw_rect(Rect2(drag_start, drag_end - drag_start),
					Color(1, 1, 0.5), false)