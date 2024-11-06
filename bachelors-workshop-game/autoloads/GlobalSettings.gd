extends Node
signal mouse_sensitivity_updated(value)

func update_mouse_sens(value):
	emit_signal("mouse_sensitivity_updated", value)
