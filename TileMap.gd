extends TileMap
#Sets the randomizes map

#Map parameters
export (int) var width = 64
export (int) var height = 37
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

#func spawns():
#	var startRan = starters[_randomize(0,3)]
##	print(startRan," & ",starters)
#	set_cellv(Vector2(0,0), startRan)
#	delelement(startRan)
##	print(starters)
	
	
#func _input(event):
#    var tile_pos = world_to_map(Vector2(0,0))
#    if event.is_action_pressed("ui_accept"):
#        set_cellv(tile_pos, _tileset.find_tile_by_name("B_Heart"))