extends Node
class_name UI
@onready var stamina_label = $CanvasLayer/PanelContainer/MarginContainer/GridContainer/StaminaLabel
@onready var heakth_bar = $CanvasLayer/HealthBar
# Benjamin Guth


func set_stamina_bar(stamina, max_stamina):
	stamina_label.text = "stamina: "+stamina+"/" +max_stamina
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	#$CanvasLayer/TimePanelalvContainer3/Timer.wait_time = 60
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/TimePanelContainer3/MarginContainer/TimeLabel.text = "%s" % roundf( $CanvasLayer/Timer.time_left )
	# That's the timer 
	pass

# func update():
	 

#healh bar functions 
func change_health_bar(hp):
	$CanvasLayer/HealthBar.value = hp
	
func damage_health_bar(damage):
	$CanvasLayer/HealthBar.value -= damage
	
func heal_health_bar(heal):
	$CanvasLayer/HealthBar.value += heal
	
func current_health_bar():
	return $CanvasLayer/HealthBar.value
	
#stammina bar functions 
func change_stamina_bar(new_value):
	$CanvasLayer/staminaBar.value = new_value
	
func damage_stamina_bar(ex):
	$CanvasLayer/staminaBar.value -= ex
	
func heal_stamina_bar(recharge):
	$CanvasLayer/staminaBar.value += recharge
	
func current_stamina_bar():
	return $CanvasLayer/staminaBar.value
	
func set_objective_discription(new_objective_discription):
	$CanvasLayer/PanelContainer2/MarginContainer/VBoxContainer/HBoxContainer/objective_discriptionLabel.text = new_objective_discription
