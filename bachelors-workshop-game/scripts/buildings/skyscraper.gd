extends Node3D
class_name Skyscraper

const SIZE_X = 3
const SIZE_Y = GameWorld.SKYSCRAPER_HEIGHT
const SIZE_Z = 3

@onready var instance := $MeshInstance3D

# again, prob a better way to do this but just trying to make it work
func set_mesh_color(instance: MeshInstance3D, color: Color):
	var mesh = instance.mesh
	for surface in mesh.get_surface_count():
		mesh.surface_get_material(surface).albedo_color = color
		
func set_mesh_size(instance: MeshInstance3D, size_x: int, size_y: int, size_z: int):
	instance.mesh.set_size(Vector3(SIZE_X, SIZE_Y, SIZE_Z))

func _ready():
	set_mesh_color(instance, "#808080")
	set_mesh_size(instance, SIZE_X, SIZE_Y, SIZE_Z)
