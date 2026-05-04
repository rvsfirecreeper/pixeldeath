extends Node2D
var in_office = true
var tool_handler = tools.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	in_office = true
	GameState.temp = 55
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cam_switcher()
	tool_handler.update_tools()
	
func cam_switcher():
	if Input.is_action_just_pressed("Cameras"):
		in_office = !in_office
		$Office.visible = in_office
		$Cams.visible = !in_office


func _on_temp_timer_timeout() -> void:
	if tool_handler.fans:
		GameState.temp -= 1
		print("fan on")
	else:
		GameState.temp += 0.5
		print("fan not on")
	print(GameState.temp)
