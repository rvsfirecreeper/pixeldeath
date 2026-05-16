class_name tools
const USAGE_MULT = 0.06
var usage = USAGE_MULT
func update_tools() -> void:
	if Input.is_action_just_pressed("Fan"):
		GameState.fans = !GameState.fans
	if Input.is_action_just_pressed("Power Generator"):
		GameState.GameState.power_gen = !GameState.power_gen
		GameState.music = false
	if Input.is_action_just_pressed("Music"):
		GameState.music = !GameState.music
		GameState.power_gen = false
	if Input.is_action_pressed("Flashlight"):
		GameState.flashlight = true
	else:
		GameState.flashlight = false
	var usage = calculate_usage()
func calculate_usage() -> float:
	var fa = 1 if GameState.fans else 0
	var pg = 1 if GameState.power_gen else 0
	var fl = 1 if GameState.flashlight else 0
	var m = 1 if GameState.music else 0
	return USAGE_MULT * (1 + fl + m + fa - pg)
