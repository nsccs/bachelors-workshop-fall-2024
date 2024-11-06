extends Node

signal on_mouse_sens_set(value : float)

signal on_master_sound_set(value : float)

signal set_settings_dictionary(settings_dict : Dictionary)

signal load_settings_data(settings_dict : Dictionary)

func emit_load_settings_data(settings_dict : Dictionary) -> void:
	load_settings_data.emit(settings_dict)
	
func emit_set_settings_dictionary(settings_dict : Dictionary) -> void:
	set_settings_dictionary.emit(settings_dict)

func emit_on_mouse_sens_set(value : float) -> void:
	on_mouse_sens_set.emit(value)

func emit_on_master_sound_set(value : float) -> void:
	on_master_sound_set.emit(value)
