extends TileMap
#Sets the randomizes map

#Map parameters
export (int) var width = 79
export (int) var height = 43
#export (int) var x_start
#export (int) var y_start

var _tileset
var grid = []

#grass,rock,nothing,Tree Christmas, Tree Square, Tree Double
var rand_ground = [0, 1, 10, 11, 12, 13]

#black,green,purple,yellow
#var starters = [1, 4, 8, 12]

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	_tileset = get_tileset()
	set_process_input(true)
	#An example on how to set a tile.
#	#set_cellv(Vector2(0,0), _tileset.find_tile_by_name("B_Heart"))
	grid = make_2d_array()
#	print(grid)
	set_map(grid)
	rareTreeSpawn()
	baseSpawn()
	
	
#Produces a random int value between these values.
func _randomize(a,b):
	rng.randomize()
	var rand_int = rng.randi_range(a,b)
	return rand_int
#/Used to test randomizer./
#func _input(event):
#    if event.is_action_pressed("ui_accept"):
#        print(_randomize(0,15))
	
	
#Makes a 2 diemential array.
func make_2d_array():
	var array = []
	for i in width:
		array.append([])
		for j in height:
			array[i].append(_randomize(0,100));
	return array;
	
func set_map(array):
	for i in width:
		for j in height:
			if array[i][j] <= 85 :
				set_cellv(Vector2(i,j), 10)
			elif array[i][j] <= 86 :
				set_cellv(Vector2(i,j), 15)
			elif array[i][j] <= 87 :
				set_cellv(Vector2(i,j), 1)
			elif array[i][j] <= 92 :
				set_cellv(Vector2(i,j), 11)
			elif array[i][j] <= 93 :
				set_cellv(Vector2(i,j), 12)
			else:
				set_cellv(Vector2(i,j), 0)
#	spawns()

func rareTreeSpawn():
	var ranTree = _randomize(0,100)
	if (ranTree <= 10):
		set_cellv(Vector2(53,33), 13)
		print("Rare Tree Spawned!")
		
func baseSpawn():
#	Tilemap:
#0 - Grass
#1 - Rock
#2 - WBL
#3 - WBM
#4 - WBR
#5 - WML
#6 - WMR
#7 - WTL
#8 - WTM
#9 - WTR
#10 - Nothing
#11 - Tree Christmas
#12 - Tree Square
#13 - Tree Double
#14 - Rocket
	var possibleFour = 2#_randomize(0,3)
#	print(possibleFour) #Debug test for random value
#	0 = (10,9), 1 = (53,15), 2 = (39,21), 3 = (30,29)
	if (possibleFour == 0):
		set_cell(10,9, 14, false, true) #Spawn Crashed Rocket
		#Setup base
		#Above
		#Walls
		set_cell(8,8, 7)
		set_cell(12,8, 9)
		#Space
		set_cell(9,8, 10)
		set_cell(10,8, 10)
		set_cell(11,8, 10)
		#Sides
		#Walls
		set_cell(8,9, 5)
		set_cell(12,9, 6)
		set_cell(8,10, 5)
		set_cell(12,10, 6)
		set_cell(8,11, 5)
		set_cell(12,11, 6)
		#Space
		set_cell(9,9, 10)
		set_cell(11,9, 10)
		#Below
		#Walls
		set_cell(8,12, 2)
		set_cell(9,12, 3)
		set_cell(10,12, 3)
		set_cell(11,12, 3)
		set_cell(12,12, 4)
		#Space
		set_cell(9,10, 10)
		set_cell(10,10, 10)
		set_cell(11,10, 10)
		
	if (possibleFour == 1):
		set_cellv(Vector2(53,15), 14, false, true) #Spawn Crashed Rocket
		#Setup base
		#Above
		#Walls
		set_cell(51,13, 7)
		set_cell(52,13, 8)
		set_cell(53,13, 8)
		set_cell(54,13, 8)
		set_cell(55,13, 9)
		#Space
		set_cell(52,14, 10)
		set_cell(53,14, 10)
		set_cell(54,14, 10)
		#Sides
		#Walls
		set_cell(51,14, 5)
		set_cell(51,17, 5)
		set_cell(55,14, 6)
		set_cell(55,15, 6)
		set_cell(55,16, 6)
		set_cell(55,17, 6)
		#Space
		set_cell(52,15, 10)
		set_cell(54,15, 10)
		#Below
		#Walls
		set_cell(51,18, 2)
		set_cell(52,18, 3)
		set_cell(53,18, 3)
		set_cell(54,18, 3)
		set_cell(55,18, 4)
		#Space
		set_cell(52,16, 10)
		set_cell(53,16, 10)
		set_cell(54,16, 10)
		set_cell(52,17, 10)
		set_cell(53,17, 10)
		set_cell(54,17, 10)
		
	if (possibleFour == 2):
		set_cellv(Vector2(39,21), 14, false, true) #Spawn Crashed Rocket
		#Setup base
		#Above
		#Walls
		set_cell(37,19, 7)
		set_cell(38,19, 8)
		set_cell(39,19, 8)
		set_cell(40,19, 8)
		set_cell(41,19, 9)
		#Space
		set_cell(38,20, 10)
		set_cell(39,20, 10)
		set_cell(40,20, 10)
		#Sides
		#Walls
		set_cell(37,20, 5)
		set_cell(37,21, 5)
		set_cell(37,22, 5)
		set_cell(37,23, 5)
		set_cell(41,20, 6)
		set_cell(41,23, 6)
		#Space
		set_cell(38,21, 10)
		set_cell(40,21, 10)
		#Below
		#Walls
		set_cell(37,24, 2)
		set_cell(38,24, 3)
		set_cell(39,24, 3)
		set_cell(40,24, 3)
		set_cell(41,24, 4)
		#Space
		set_cell(38,22, 10)
		set_cell(39,22, 10)
		set_cell(40,22, 10)
		
	if (possibleFour == 3):
		set_cellv(Vector2(30,29), 14, false, true) #Spawn Crashed Rocket
		#Setup base
		#Above
		#Walls
		set_cell(28,27, 7)
		set_cell(29,27, 8)
		set_cell(30,27, 8)
		set_cell(31,27, 8)
		set_cell(32,27, 9)
		#Space
		set_cell(29,28, 10)
		set_cell(30,28, 10)
		set_cell(31,28, 10)
		#Sides
		#Walls
		set_cell(28,28, 5)
		set_cell(28,29, 5)
		set_cell(28,30, 5)
		set_cell(28,31, 5)
		set_cell(28,32, 5)
		set_cell(32,28, 6)
		set_cell(32,32, 6)
		#Space
		set_cell(29,29, 10)
		set_cell(31,29, 10)
		#Below
		#Walls
		set_cell(28,33, 2)
		set_cell(29,33, 3)
		set_cell(30,33, 3)
		set_cell(31,33, 3)
		set_cell(32,33, 4)
		#Space
		set_cell(29,30, 10)
		set_cell(30,30, 10)
		set_cell(31,30, 10)
		set_cell(29,32, 10)
		set_cell(30,32, 10)
		set_cell(31,32, 10)
		
		
		
		
	