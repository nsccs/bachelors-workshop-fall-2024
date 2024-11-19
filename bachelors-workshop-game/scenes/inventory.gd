extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_exit_button_pressed() -> void:
	$".".visible = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	

func _input(event):
	if event.is_action_pressed("inventory"):
		$".".visible = true;
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
