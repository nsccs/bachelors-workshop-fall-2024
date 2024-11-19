extends Node3D
class_name Puddle

@onready var instance := $MeshInstance3D

# again, prob a better way to do this but just trying to make it work
func set_mesh_color(instance: MeshInstance3D, color: Color):
	var mesh = instance.mesh
	for surface in mesh.get_surface_count():
		mesh.surface_get_material(surface).albedo_color = color

func _ready():
	set_mesh_color(instance, "#0000AA")
