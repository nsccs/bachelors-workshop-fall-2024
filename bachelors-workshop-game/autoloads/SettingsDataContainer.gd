extends Node

var master_volume : float = 0.0
var mouse_sens : float = 0.0
var loaded_data : Dictionary = {}

func _ready():
	handle_signals()
	
func create_storage_dictionary() -> Dictionary:
	var settings_container_dict : Dictionary = {
		"master_volume" : master_volume,
		"mouse_sens" : mouse_sens,
	}
	
	return settings_container_dict

func get_master_volume() -> float:
	if loaded_data == {}:
		return 0.0
	return master_volume

func get_mouse_sens() -> float:
	if loaded_data == {}:
		return 0.03
	return master_volume

func on_master_sound_set(value : float) -> void:
	master_volume = value

func on_mouse_sens_set(value : float) -> void:
	mouse_sens = value

func on_settings_data_loaded(data : Dictionary) -> void:
	loaded_data = data
	on_master_sound_set(loaded_data.master_volume)
	on_mouse_sens_set(loaded_data.mouse_sens)

func handle_signals() -> void:
	SettingsSignalBus.on_master_sound_set.connect(on_master_sound_set)
	SettingsSignalBus.on_mouse_sens_set.connect(on_mouse_sens_set)
	SettingsSignalBus.load_settings_data.connect(on_settings_data_loaded)
