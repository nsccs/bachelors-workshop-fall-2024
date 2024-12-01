extends Node3D
class_name GameWorld

const MAP_SIZE = 100 # map is a square, this is effectively its length and width in tiles.
const TILE_SIZE = 32 
const BUILDING_COUNT = 20
const PUDDLE_FACTOR = 0.2 # this number needs playing around with. just know that higher = higher likelihood
						  # of puddles instantiating
const SPLIT_ITERATIONS = 5 # will produce at maximum 2^n 'boxes' which buildings can fill
const GRID_NOISE = 1.4 # this gives us a grid not too chaotic but not too simple (???)
const MIN_SPACE_BETWEEN_ROADS_FACTOR = 4 # ensures we don't get parallel roads super close to one another
const MIN_SPACE_BETWEEN_BUILDING_AND_STREET = 6 # ensures buildings don't touch streets. depends on
												# how big our prefab buildings are

var rng = RandomNumberGenerator.new()
var filled_locations = [] # every entry is a location where a generated tile is. format:
						  # int x, int x, boolean tileExists

enum BuildingType {
	SKYSCRAPER,
	APARTMENT,
	RESTAURANT,
	# FACTORY,
	# POLICE_STATION,
	# FIRE_STATION
}

enum TileType {
	NONE,
	STREET,
	MEDIAN,
	PUDDLE,
	RUBBLE
}

@export var noise: FastNoiseLite

# ground tiles
@export var none: PackedScene
@export var street: PackedScene
@export var median: PackedScene
@export var puddle: PackedScene
@export var rubble: PackedScene

# buildings
@export var skyscraper: PackedScene
@export var apartment: PackedScene
@export var restaurant: PackedScene
# @export var factory: PackedScene
# @export var police_station: PackedScene
# @export var fire_station: PackedScene

func generate_world():
	
	# border
	generate_border()
	
	# roads
	generate_roads(SPLIT_ITERATIONS)
	
	# buildings
	for n in BUILDING_COUNT:
		# ensures buildings are min spaces away from the border and from every street tile
		var x = rng.randi_range(MIN_SPACE_BETWEEN_BUILDING_AND_STREET, MAP_SIZE - MIN_SPACE_BETWEEN_BUILDING_AND_STREET)
		var y = rng.randi_range(MIN_SPACE_BETWEEN_BUILDING_AND_STREET, MAP_SIZE - MIN_SPACE_BETWEEN_BUILDING_AND_STREET)
		while filled_locations.has([x, y, true]):
			x = rng.randi_range(MIN_SPACE_BETWEEN_BUILDING_AND_STREET, MAP_SIZE - MIN_SPACE_BETWEEN_BUILDING_AND_STREET)
			y = rng.randi_range(MIN_SPACE_BETWEEN_BUILDING_AND_STREET, MAP_SIZE - MIN_SPACE_BETWEEN_BUILDING_AND_STREET)
		
		# maybe we can weigh different building types later, but for now each 
		# building has a random chance of being drawn
		
		# ensures buildings are min spaces away from each other
		for i in range((MIN_SPACE_BETWEEN_BUILDING_AND_STREET / 2) * -1, MIN_SPACE_BETWEEN_BUILDING_AND_STREET / 2):
			for j in range((MIN_SPACE_BETWEEN_BUILDING_AND_STREET / 2) * -1, MIN_SPACE_BETWEEN_BUILDING_AND_STREET / 2):
				if i != 0 && j != 0:
					filled_locations.append([x + i, y + j, false])
				else:
					filled_locations.append([x + i, y + j, true])
		generate_building(x, y, rng.randi_range(0, BuildingType.size() - 1))
		
	
	generate_remainder()
	
	# rubble
	generate_rubble()


# todo
func destroy_world():
	pass

# instantiates a building scene (as of now, a 1x1x1 tile)
# todo: figure out why it spits out the same type no matter what type is passed
func generate_building(x: int, y: int, type: int):
	# there's gotta be a better way to do this but...
	match type:
		0:
			var skyscraper = skyscraper.instantiate()
			skyscraper.position = Vector3(x, y, 0.0)
			add_child(skyscraper)
		1:
			var apartment = apartment.instantiate()
			apartment.position = Vector3(x, y, 0.0)
			add_child(apartment)
		2:
			var restaurant = restaurant.instantiate()
			restaurant.position = Vector3(x, y, 0.0)
			add_child(restaurant)

func generate_roads(iterations: int):
	split(iterations, 0, 0, MAP_SIZE, 0, MAP_SIZE)

# recursively 'splits' the map in half by placing street tiles in straight lines
# in either the x or y direction, from the given grids end to other end
func split(iterations: int, direction: int, x_min: int, x_max: int, y_min: int, y_max: int):
	if iterations == 0:
		return
	var x_space = x_max - x_min
	var y_space = y_max - y_min
	if x_space < MAP_SIZE / MIN_SPACE_BETWEEN_ROADS_FACTOR or y_space < MAP_SIZE / MIN_SPACE_BETWEEN_ROADS_FACTOR:
		return
	
	# split along x
	if direction == 0:
		# don't want to create divides too close to edge
		var position = rng.randi_range(x_min + (x_space / GRID_NOISE), x_max - (x_space / GRID_NOISE))
		for i in range(y_min, y_max):
			generate_tile(position, i, 0.0, TileType.MEDIAN)
			for j in range((MIN_SPACE_BETWEEN_BUILDING_AND_STREET / 2) * -1, MIN_SPACE_BETWEEN_BUILDING_AND_STREET / 2):
				if j != 0:
					filled_locations.append([position + j, i, false])
				else:
					filled_locations.append([position + j, i, true])
					
		split(iterations - 1, 1, x_min, position, y_min, y_max)
		split(iterations - 1, 1, position, x_max, y_min, y_max)
	# split along y
	else:
		var position = rng.randi_range(y_min + (y_space / GRID_NOISE), y_max - (y_space / GRID_NOISE))
		for i in range(x_min, x_max):
			generate_tile(i, position, 0.0, TileType.MEDIAN)
			for j in range((MIN_SPACE_BETWEEN_BUILDING_AND_STREET / 2) * -1, MIN_SPACE_BETWEEN_BUILDING_AND_STREET / 2):
				if j != 0:
					filled_locations.append([i, position + j, false])
				else:
					filled_locations.append([i, position + j, true])
		split(iterations - 1, 0, x_min, x_max, y_min, position)
		split(iterations - 1, 0, x_min, x_max, position, y_max)

# as of now, just generates the border
# todo: why is it not rubble? also create algo to spawn rubble in sightlines
func generate_border():
	for i in MAP_SIZE:
		generate_tile(i, 0, 0.0, TileType.RUBBLE)
		filled_locations.append([i, 0, true])
		generate_tile(i, MAP_SIZE, 0.0, TileType.RUBBLE)
		filled_locations.append([i, MAP_SIZE, true])
		generate_tile(0, i, 0.0, TileType.RUBBLE)
		filled_locations.append([0, i, true])
		generate_tile(MAP_SIZE, i, 0.0, TileType.RUBBLE)
		filled_locations.append([MAP_SIZE, i, true])

func generate_rubble():
	for x in range(MAP_SIZE):
		for y in range(MAP_SIZE):
			# Ensure rubble stays in the exterior of the map and avoids buildings and streets
			if (x > MIN_SPACE_BETWEEN_BUILDING_AND_STREET and x < MAP_SIZE - MIN_SPACE_BETWEEN_BUILDING_AND_STREET and
				y > MIN_SPACE_BETWEEN_BUILDING_AND_STREET and y < MAP_SIZE - MIN_SPACE_BETWEEN_BUILDING_AND_STREET):
				# Avoid collisions with filled locations
				if !is_filled(x, y):
					# Use noise to randomize rubble placement
					var noise_value = noise.get_noise_2d(x, y)
					if noise_value > 0.1:  # Adjust threshold as needed
						var noise_map = noise.get_noise_2d(x, y)
						if noise_map > 0.1:
							generate_tile(x, y, 0.0, TileType.RUBBLE)
							filled_locations.append([x, y, true])

func is_filled(x: int, y: int) -> bool:
	return filled_locations.has([x, y, true])


# adds a tile node to the world
func generate_tile(x: int, y: int, z: int, type: TileType = TileType.NONE):
	if type == TileType.NONE:
		type = get_puddle_or_street(x, y)
	match type:
		TileType.STREET:
			var street = street.instantiate()
			street.position = Vector3(x, y, z)
			add_child(street)
		TileType.MEDIAN:
			var median = median.instantiate()
			median.position = Vector3(x, y, z)
			add_child(median)
		TileType.PUDDLE:
			var puddle = puddle.instantiate()
			puddle.position = Vector3(x, y, z)
			add_child(puddle)
		TileType.RUBBLE:
			var rubble = rubble.instantiate()
			rubble.position = Vector3(x, y, z)
			add_child(rubble)

# where there are no tiles after other generations finished, fill with
# 'default' street type tiles
func generate_remainder():
	for x in MAP_SIZE:
		for y in MAP_SIZE:
			if !filled_locations.has([x, y, true]):
				generate_tile(x, y, 0.0, TileType.STREET)

# might be deprecated, would be used to generate either a 'default' tile or
# puddle tile
func get_puddle_or_street(x: int, y: int) -> TileType:
	var value = noise.get_noise_2d(x, y)
	
	if value >= PUDDLE_FACTOR:
		return TileType.STREET
		
	return TileType.PUDDLE

func _ready():
	generate_world()
