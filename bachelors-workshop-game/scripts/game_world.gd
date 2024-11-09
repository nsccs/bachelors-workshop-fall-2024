extends Node3D
class_name GameWorld

const MAP_SIZE = 100
const TILE_SIZE = 32
const BUILDING_COUNT = 10

var rng = RandomNumberGenerator.new()

@export var noise: FastNoiseLite
@export var tile: PackedScene
@export var building: PackedScene

func generate_world():
	# buildings
	for n in BUILDING_COUNT:
		var x = rng.randf_range(0, MAP_SIZE)
		var y = rng.randf_range(0, MAP_SIZE)
		generate_building(x, y)
	
func destroy_world():
	pass
	
func generate_building(x: int, y: int):
	var building = building.instantiate()
	# maybe we can weigh different building types later, but for now each 
	# building has a random chance of being drawn
	var type = rng.randi_range(0, Building.BuildingType.size() - 1)
	# there's gotta be a better way to do this but...
	match type:
		0:
			building.building_type = Building.BuildingType.SKYSCRAPER
		1:
			building.building_type = Building.BuildingType.APARTMENT
		2:
			building.building_type = Building.BuildingType.RESTAURANT
		3:
			building.building_type = Building.BuildingType.FACTORY
		4:
			building.building_type = Building.BuildingType.POLICE_STATION
		5:
			building.building_type = Building.BuildingType.FIRE_STATION
		
	building.position = Vector3(x, y, 0.0)
	add_child(building)
	
func generate_roads():
	pass
	
func generate_rubble():
	pass
	
func generate_tile(x: int, y: int):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_world()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
