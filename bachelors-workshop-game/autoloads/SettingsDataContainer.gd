extends Node

var master_volume : float = 0.0

func _ready():
	handle_signals()

func on_master_sound_set(value : float) -> void:
	master_volume = value
	
func handle_signals() -> void:
	SettingsSignalBus.on_master_sound_set.connect(on_master_sound_set)
