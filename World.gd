extends Node2D

var night = false
export var dnTimer = 600
export var nTime = 125

func _ready() -> void:
	set_process(true)
	get_node("CanvasLayer/Container/Label").text = "Day"#"Time: "+String(dnTimer)
	get_node("Button").visible = false
	

func _process(delta: float):
	dnTimer-=.05
	if (dnTimer <= 0):
		get_node("CanvasLayer/Container/Label").text = "Day"#"Time: "+String(dnTimer)
		VisualServer.set_default_clear_color(Color(0.39,0.22,0.24,1.0))
		get_node("CanvasLayer/Container/Label").add_color_override("font_color", Color(1,1,1,1))
		print("Day again")
		dnTimer = 600
	if(dnTimer == 350):
		get_node("CanvasLayer/Container/Label").text = "Night Coming"
		get_node("CanvasLayer/Container/Label").add_color_override("font_color", Color(1,0.4,0,1))
		print("Night Coming")
	if(dnTimer == 300):
		VisualServer.set_default_clear_color(Color(0.1,0.1,0.4,1.0))
		get_node("CanvasLayer/Container/Label").text = "Night"
		get_node("CanvasLayer/Container/Label").add_color_override("font_color", Color(1,0.1,0,1))
		print("Night")
		
	#Grass, Ore, Rock, Tree
	if(global.counter1 >= 5 and global.counter2 >= 20 and global.counter3 >= 4 and global.counter4 >= 15):
		get_node("Button").visible = true


func _on_Button_button_down() -> void:
	get_tree().change_scene("res://MainMenu.tscn")
