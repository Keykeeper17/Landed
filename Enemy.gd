extends KinematicBody2D

var enemy = preload("res://Art/Enemy.png")
var enemy_attack = preload("res://Art/Enemy_attack.png")

var run_speed = 50
var velocity = Vector2.ZERO
var player = null

#30,12 

func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position)
	velocity = move_and_slide(velocity * run_speed)
	for i in get_slide_count():
			var collision = get_slide_collision(i)
#			print("Collided with: ", collision.collider.name)
#			collision.collider.queue_free()
	

func _on_Area2D_body_entered(body: PhysicsBody2D):
	if body.is_in_group("player"):
#		print("Body: ",body.name)
		player = body
		get_node("Sprite").set_texture(enemy_attack)
#		self.queue_free()

func _on_Area2D_body_exited(body: PhysicsBody2D) -> void:
	player = null
	get_node("Sprite").set_texture(enemy)


func _on_Area2D2_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("player"):
		print("touched: ",body.name)
#		Example of how to access a variable inside another script #This is a mess lol
#		print(get_node("/root/World").dnTimer)
#		get_node("/root/World").dnTimer = 10
#		print(get_node("/root/World").dnTimer)
		get_node("/root/World").selected.clear()
		body.queue_free()
	
