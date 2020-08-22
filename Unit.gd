extends KinematicBody2D

export (int) var speed = 100

var target = Vector2()
var velocity = Vector2.ZERO

export var selected = false
onready var unit_selected = $Selected

var movement = Vector2()

onready var Tilenode = get_node("../TileMap")

var t = Timer.new()


func _ready():
	target = get_position()
	t.set_wait_time(10)
	t.set_one_shot(true)
	self.add_child(t)


func _physics_process(delta):
	velocity = position.direction_to(target)
	if selected and Input.is_action_pressed("click"):
		target = get_global_mouse_position()
		
	if selected and Input.is_action_pressed("right_click"):
		selected = false
    # look_at(target)
	unit_selected.visible = selected
	if position.distance_to(target) > 5:
		movement = move_and_slide(velocity * speed)
#		print(Tilenode.get_cellv(Tilenode.world_to_map(position)))

	if ((Tilenode.get_cellv(Tilenode.world_to_map(position))) == 0 and t.is_stopped() == true):
		t.start()
		global.counter1+=1
		get_node("../../World/Camera2D/CanvasLayer/Grass_Label").text = "x"+String(global.counter1)
		print("Grass")
		yield(t, "timeout")
	
	if ((Tilenode.get_cellv(Tilenode.world_to_map(position))) == 1 and t.is_stopped() == true):
		t.start()
		global.counter2+=1
		get_node("../../World/Camera2D/CanvasLayer/Rock_Label").text = "x"+String(global.counter2)
		print("Rock")
		yield(t, "timeout")
	
	if (((Tilenode.get_cellv(Tilenode.world_to_map(position))) == 11 or (Tilenode.get_cellv(Tilenode.world_to_map(position))) == 12) and t.is_stopped() == true):
		t.start()
		global.counter3+=1
		get_node("../../World/Camera2D/CanvasLayer/Tree_Label").text = "x"+String(global.counter3)
		print("Tree")
		yield(t, "timeout")
		
	if ((Tilenode.get_cellv(Tilenode.world_to_map(position))) == 13 and t.is_stopped() == true):
		t.start()
		global.counter3+=2
		get_node("../../World/Camera2D/CanvasLayer/Tree_Label").text = "x"+String(global.counter3)
		print("Rare Tree!")
		yield(t, "timeout")
	