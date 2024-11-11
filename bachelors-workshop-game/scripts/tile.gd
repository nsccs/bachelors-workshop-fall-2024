extends Node3D
class_name Tile

enum TileType {
	NONE,
	STREET,
	MEDIAN,
	PUDDLE,
	RUBBLE
}

@export var tile_type: TileType

@onready var instance := $MeshInstance3D

func set_mesh_color(instance: MeshInstance3D, color: Color):
	var mesh = instance.mesh
	for surface in mesh.get_surface_count():
		mesh.surface_get_material(surface).albedo_color = color

func _ready():
	match tile_type:
		TileType.NONE:
			set_mesh_color(instance, Color(1, 1, 1, 0))
		TileType.STREET:
			set_mesh_color(instance, "#343434")
		TileType.MEDIAN:
			set_mesh_color(instance, "#FDDA0D")
		TileType.PUDDLE:
			set_mesh_color(instance, "#0000AA")
		TileType.RUBBLE:
			set_mesh_color(instance, "#D3D3D3")
