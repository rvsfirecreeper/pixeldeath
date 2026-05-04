class_name tools
var fans = true
var music = false
var flashlight = false
var power_gen = false
const USAGE_MULT = 0.06
var usage = USAGE_MULT
func update_tools() -> void:
	if Input.is_action_just_pressed("Fan"):
		fans = !fans
	if Input.is_action_just_pressed("Power Generator"):
		power_gen = !power_gen
		music = false
	if Input.is_action_just_pressed("Music"):
		music = !music
		power_gen = false
	if Input.is_action_pressed("Flashlight"):
		flashlight = true
	else:
		flashlight = false
	var usage = calculate_usage(flashlight, power_gen, fans, music)
func calculate_usage(flash, power_gen, fan, music) -> float:
	var fa = 1 if fan else 0
	var pg = 1 if power_gen else 0
	var fl = 1 if flash else 0
	var m = 1 if music else 0
	return USAGE_MULT * (1 + fl + m + fa - pg)
