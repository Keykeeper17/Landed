extends Node2D

func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_Controls_pressed() -> void:
	get_tree().change_scene('res://ControlsScene.tscn')


func _on_Play_pressed() -> void:
	get_tree().change_scene('res://FadeIn.tscn')
