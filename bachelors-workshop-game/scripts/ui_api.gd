extends Node
class_name UI
@onready var stamina_label = $CanvasLayer/PanelContainer/MarginContainer/GridContainer/StaminaLabel

func set_stamina_bar(stamina, max_stamina):
	stamina_label.text = "stamina: "+stamina+"/" +max_stamina
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
