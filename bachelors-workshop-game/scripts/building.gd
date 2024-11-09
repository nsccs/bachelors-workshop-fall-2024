extends Node3D
class_name Building

enum BuildingType {
	SKYSCRAPER,
	APARTMENT,
	RESTAURANT,
	FACTORY,
	POLICE_STATION,
	FIRE_STATION
}

@export var building_type: BuildingType

@onready var instance := $MeshInstance3D

# again, prob a better way to do this but just trying to make it work
func set_mesh_color(instance: MeshInstance3D, color: Color):
	var mesh = instance.mesh
	for surface in mesh.get_surface_count():
		mesh.surface_get_material(surface).albedo_color = color

# Called when the node enters the scene tree for the first time.
func _ready():
	match building_type:
		BuildingType.SKYSCRAPER:
			set_mesh_color(instance, "#808080")
		BuildingType.APARTMENT:
			set_mesh_color(instance, "#C19770")
		BuildingType.RESTAURANT:
			set_mesh_color(instance, "#E6E6E6")
		BuildingType.FACTORY:
			set_mesh_color(instance, "#222222")
		BuildingType.POLICE_STATION:
			set_mesh_color(instance, "#000991")
		BuildingType.FIRE_STATION:
			set_mesh_color(instance, "#D1001F")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
