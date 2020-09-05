extends Node

var counter1 = 0 #Grass
var counter2 = 0 #Ore
var counter3 = 0 #Rock
var counter4 = 0 #Tree

var UID
var UID2
var UID3
var UID4
var UID5

func _ready():
	set_process(true)
#	VisualServer.set_default_clear_color(Color(0.3,0.3,0.3,1.0))   #Default background color
	VisualServer.set_default_clear_color(Color(0.39,0.22,0.24,1.0))
	
#	Moved to World to not effect main menu
#func _process(delta: float):
#	dnTimer-=1
#	if (dnTimer == 0):
#		VisualServer.set_default_clear_color(Color(0.39,0.22,0.24,1.0))
#		print("Day again")
#		dnTimer = 250
#	if(dnTimer == 125):
#		VisualServer.set_default_clear_color(Color(0.1,0.1,0.4,1.0))
#		print("Night")
		