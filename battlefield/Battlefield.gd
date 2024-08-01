extends Node

@export var knight_scene: PackedScene
@export var tower_scene: PackedScene
@export var wall_scene: PackedScene
# @export var missile_scene: PackedScene

var knights	= []#16
var towers	= []#4
var walls	= []#24
@onready var flag = $Flag
# @onready var nav_map = 
# nav polygon -> nav regions -> nav map? -> nav server
# useful methods / functions
# map_set_use_edge_connections
# map_set_use_edge_connection_margin

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_knight(knights, Vector2(400,400))
	spawn_tower(towers, Vector2(400, 300))
	spawn_tower(towers, Vector2(300, 300))
	# pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(_delta):
	pass


func spawn_knight(array, location):
	var new_knight = knight_scene.instantiate()
	new_knight.position = location
	array.append(new_knight)
	add_child(new_knight)

func spawn_tower(array, location):
	var new_tower = tower_scene.instantiate()
	new_tower.position = location
	array.append(new_tower)
	add_child(new_tower)

func spawn_wall(array, location):
	var new_wall = wall_scene.instantiate()
	new_wall.position = location
	array.append(new_wall)
	add_child(new_wall)
