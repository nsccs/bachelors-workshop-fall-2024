# Benjamin Guth
extends Control

# var next_scene = "res://scenes/sewer_bedroom.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	# ResourceLoader.load_threaded_request(next_scene)
	# start loading our scene 
	ResourceLoader.load_threaded_request(GameManager.next_scene)
	# In the game_manager, lives the global var game_manager.next_scene
	# set game_manager.next_scene to the new scene to load that scene but with this loading screen 
	# pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progress = [] 
	ResourceLoader.load_threaded_get_status(GameManager.next_scene, progress)
	# want to know the progress of what we are loading 
	$progress_bar.value = progress[0]*100
	$progress_number.text = str(progress[0]*100)+"%"
	
	if progress[0] == 1:
		var packed_scene = ResourceLoader.load_threaded_get(GameManager.next_scene)
		# done loading, so moves to it 
		get_tree().change_scene_to_packed(packed_scene)
	
	#pass

# simple loading scene 
