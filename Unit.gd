extends KinematicBody2D

export (int) var speed = 100

var target = Vector2()
var velocity = Vector2.ZERO

export var selected = false
onready var unit_selected = $Selected

var movement = Vector2()

onready var Tilenode = get_node("../TileMap")

func _ready():
	target = get_position()

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
