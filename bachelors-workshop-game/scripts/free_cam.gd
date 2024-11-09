extends Camera3D

var sensitivity = 0.003
var speed = 10

var view: Viewport = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	view = get_viewport() # Replace with function body.
	lastMousePos = view.get_mouse_position()


var lastMousePos = null
var currentMousePos = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	currentMousePos = view.get_mouse_position()
	
	speed = 5
	if Input.is_action_pressed("sprint"):
		speed = 15
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		rotation.y += ((currentMousePos.x - lastMousePos.x)*-sensitivity)
		rotation.x +=((currentMousePos.y - lastMousePos.y)*-sensitivity)
		
		if Input.is_action_pressed("move_forward"):
			position -= transform.basis.orthonormalized().z * delta * speed
		elif Input.is_action_pressed("move_backward"):
			position += transform.basis.orthonormalized().z * delta * speed
			
		if Input.is_action_pressed("move_right"):
			position += transform.basis.orthonormalized().x * delta * speed
		if Input.is_action_pressed("move_left"):
			position -= transform.basis.orthonormalized().x * delta * speed
			
		if Input.is_action_pressed("jump"):
			position += transform.basis.orthonormalized().y * delta * speed
		elif Input.is_key_pressed(KEY_CTRL):
			position -= transform.basis.orthonormalized().y * delta * speed
		
	
	lastMousePos = currentMousePos
