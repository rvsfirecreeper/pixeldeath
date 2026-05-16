extends Node
const BONNIE_Y = 324
const BONNIE_RIGHT_X = 922
const BONNIE_LEFT_X = 230
const BONNIE_CENTER_X = 576
var required_flash_time = 4.0
var flash_time = 0.0
var bonnie_stage = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BonnieSprite.position = Vector2(BONNIE_CENTER_X, BONNIE_Y)
	$BonnieAudio.position = $BonnieSprite.position
	$BonnieAudio.play()	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameState.flashlight:
		flash_time += delta

func _on_main_not_office(): # Replace with function body.
	$BonnieSprite.visible = false
func _on_main_office() -> void:
	$BonnieSprite.visible = true # Replace with function body.
	if GameState.blood:
		var side = randi_range(0, 2)
		if side == 0:
			$BonnieSprite.position = Vector2(BONNIE_LEFT_X, BONNIE_Y)
		if side == 1:
			$BonnieSprite.position = Vector2(BONNIE_CENTER_X, BONNIE_Y)
		if side == 2:
			$BonnieSprite.position = Vector2(BONNIE_RIGHT_X, BONNIE_Y)
		$BonnieAudio.position = $BonnieSprite.position
		$BonnieAudio.play()
func _on_interval() -> void:
	if flash_time >= required_flash_time:
		if GameState.blood:
			required_flash_time = flash_time
		flash_time = 0
	else:
		if randi() % 20 < GameState.bonnie_ai:
			bonnie_stage += 1
		if bonnie_stage >= 8:
			Functions.jumpscare("Bonnie")
