extends Node2D
signal not_office
signal office
var in_office = true
var tool_handler = tools.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	in_office = true
	GameState.temp = 55
	GameState.power = 100
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cam_switcher()
	tool_handler.update_tools()
	GameState.power -= tool_handler.usage
	
func cam_switcher():
	if Input.is_action_just_pressed("Cameras"):
		in_office = !in_office
		$Office.visible = in_office
		$Cams.visible = !in_office
		if in_office:
			emit_signal("office")
		if !in_office:
			emit_signal("not_office")

func _on_temp_timer_timeout() -> void:
	if GameState.fans:
		GameState.temp -= 1
		print("fan on")
	else:
		GameState.temp += 0.5
		print("fan not on")
	print(GameState.temp)
