extends CharacterBody3D
class_name PlayerCharacter

@export var supply_count = 0
const WALK_SPEED = 5.0
const SPRINT_SPEED = 8.0
const JUMP_VELOCITY = 4.5

var sensitivity = 0.003
var gravity = 9.8
var speed
var health = 100.0

@onready var head = $Head
@onready var camera = $Head/Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	GlobalSettings.connect("mouse_sensitivity_updated", Callable(self, "_on_mouse_sens_updated"))
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * sensitivity)
		camera.rotate_x(-event.relative.y * sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-70), deg_to_rad(80))
		
func _getHealth():
	return health
		
func _damage(attack):
	health -= attack

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Handle sprint.
	if Input.is_action_pressed("sprint"):
		speed = SPRINT_SPEED
	else:
		speed = WALK_SPEED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 10.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 10.0)
	else: 
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 4.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 4.0)

	move_and_slide()

func _on_mouse_sens_updated(value):
	sensitivity = value
	
