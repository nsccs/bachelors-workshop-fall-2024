extends Node

var game_state
var city_time = 0
var city_time_is_stopped := false

enum GameState {
	MAIN_MENU,
	IN_GAME,
	PAUSED,
	ROUND_END,
	CLEANUP,
	GAME_OVER
}

signal game_state_changed

func _update_game_state(new_state: GameState) -> void:
	game_state = new_state
	
	match new_state:
		GameState.MAIN_MENU:
			
			city_time_is_stopped = true
		GameState.IN_GAME:
			city_time_is_stopped = false
		GameState.PAUSED:
			city_time_is_stopped = true
		GameState.ROUND_END:
			city_time_is_stopped = true
			_reset_city_time()
		GameState.CLEANUP:
			city_time_is_stopped = true
			_reset_city_time()
		GameState.GAME_OVER:
			city_time_is_stopped = true
			_reset_city_time()
	
	game_state_changed.emit(game_state)

func _reset_city_time() -> void:
	city_time = 0
	
func _get_player_character() -> PlayerCharacter:
	return null
	
func _get_supply_count(player: PlayerCharacter) -> int:
	return PlayerCharacter.supply_count
	
func _get_city_time() -> float:
	return city_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_game_state(GameState.MAIN_MENU)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !city_time_is_stopped:
		city_time += delta
