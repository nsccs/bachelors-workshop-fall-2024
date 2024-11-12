extends Node3D

@export var shop_scene: PackedScene

signal shop_area_entered
signal shop_area_exited

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ShopArea.connect("body_entered", Callable(self, "_on_shop_area_body_entered"))
	$ShopArea.connect("body_exited", Callable(self, "_on_shop_area_body_exited"))
	$"../Shop".visible = false;


func open_shop():
	$"../Shop".visible = true

func close_shop():
	$"../Shop".visible = false


func _on_shop_area_body_entered(body: Node3D) -> void:
	if body.name == "PlayerCharacter":
		#this works!
		#print("player entered shop area") #debug message
		body.shop_reference = self


func _on_shop_area_body_exited(body: Node3D) -> void:
	if body.name == "PlayerCharacter":
		#this works!
		#print("player exited shop area") #debug message
		body.shop_reference = null
		close_shop()
