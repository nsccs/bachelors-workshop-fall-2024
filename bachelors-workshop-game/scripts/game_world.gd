extends Node3D
class_name GameWorld

const MAP_SIZE = 1000
const TILE_SIZE = 1

@export var noise: FastNoiseLite
@export var tile: PackedScene
@export var building: PackedScene

func generate_world():
	pass
	
func destroy_world():
	pass
	
func generate_building():
	var building = building.instantiate()
	var rng = RandomNumberGenerator.new()
	var x = rng.randf_range(0, MAP_SIZE)
	var y = rng.randf_range(0, MAP_SIZE)
	building.position = Vector2(x, y) * TILE_SIZE
	add_child(building)
	pass
	
	
func generate_roads():
	pass
	
func generate_rubble():
	pass
	
func generate_tile(x: int, y: int):
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
