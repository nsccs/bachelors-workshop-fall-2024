extends Node

signal on_master_sound_set(value : float)

signal set_settings_dictionary(settings_dict : Dictionary)

func emit_set_settings_dictionary(settings_dict: Dictionary) -> void:
	set_settings_dictionary.emit(settings_dict)	

func emit_on_master_sound_set(value : bool) -> void:
	on_master_sound_set.emit(value)
