extends Node2D

var night = false
export var dnTimer = 600
export var nTime = 125

onready var unitID = $Node2D.unitid
onready var unitID2 = get_node("Node2D2").unitid
onready var unitID3 = get_node("Node2D3").unitid
onready var unitID4 = get_node("Node2D4").unitid
onready var unitID5 = get_node("Node2D5").unitid


func _ready() -> void:
	set_process(true)
	get_node("CanvasLayer/Container/Label").text = "Day"#"Time: "+String(dnTimer)
	global.UID = unitID
	global.UID2 = unitID2
	global.UID3 = unitID3
	global.UID4 = unitID4
	global.UID5 = unitID5
#	print("wUnit ",unitID)
#	print("wUnit2 ",unitID2)
#	print("wUnit3 ",unitID3)
#	print("wUnit4 ",unitID4)
#	print("wUnit5 ",unitID5)
	get_node("Launch").visible = false
	

func _process(delta: float):
	dnTimer-=.4
#	print(dnTimer)
	if (dnTimer <= 0):
		get_node("CanvasLayer/Container/Label").text = "Day"#"Time: "+String(dnTimer)
		VisualServer.set_default_clear_color(Color(0.39,0.22,0.24,1.0))
		get_node("CanvasLayer/Container/Label").add_color_override("font_color", Color(1,1,1,1))
		print("Day again")
		dnTimer = 600
	if(dnTimer <= 400):
		get_node("CanvasLayer/Container/Label").text = "Night Coming"
		get_node("CanvasLayer/Container/Label").add_color_override("font_color", Color(1,0.4,0,1))
		print("Night Coming")
	if(dnTimer <= 300):
		VisualServer.set_default_clear_color(Color(0.1,0.1,0.4,1.0))
		get_node("CanvasLayer/Container/Label").text = "Night"
		get_node("CanvasLayer/Container/Label").add_color_override("font_color", Color(1,0.1,0,1))
		print("Night")
	if(dnTimer <= 100):
		VisualServer.set_default_clear_color(Color(0.1,0.1,0.4,1.0))
		get_node("CanvasLayer/Container/Label").text = "Day Coming"
		get_node("CanvasLayer/Container/Label").add_color_override("font_color", Color(1,0.4,0,1))
		print("Night")
		
	#Grass, Ore, Rock, Tree
	if(global.counter1 >= 5 and global.counter2 >= 20 and global.counter3 >= 4 and global.counter4 >= 15):
		get_node("Launch").visible = true


func _on_Launch_pressed() -> void:
	get_tree().change_scene("res://Outro.tscn")
	
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
					if(item.collider_id == unitID or item.collider_id == unitID2 or item.collider_id == unitID3 or item.collider_id == unitID4 or item.collider_id == unitID5):
#						print(item.collider_id)
						item.collider.target = get_global_mouse_position()
						item.collider.selected = false
					else:
						pass
				selected = []
				print("seleceted: ",selected)
				
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
#			print(selected) #prints array of queried objects
			
#			print(selected.collider)
			
			for item in selected:
#				print("Test: ",item.collider_id) #prints first collider id number
#				print("Test: ",item.keys()) # prints the keys in the dictonary
#				print("Test: ",item.collider) #prints current selected object
				if(item.collider_id == unitID or item.collider_id == unitID2 or item.collider_id == unitID3 or item.collider_id == unitID4 or item.collider_id == unitID5):
					item.collider.selected = true
#				else:
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

