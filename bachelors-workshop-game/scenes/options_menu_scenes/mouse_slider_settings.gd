extends Control

@onready var mouse_num_lbl =  $HBoxContainer/Mouse_Number_Lbl as Label
@onready var h_slider = $HBoxContainer/HSlider as HSlider

func _ready():
	pass

func load_data():
	_on_mouse_sens_slider_value_changed(SettingsContainer.get_mouse_sens())
	
func _on_mouse_sens_slider_value_changed(value: float) -> void:
	GlobalSettings.update_mouse_sens(value)
	mouse_num_lbl.text = str(value)
