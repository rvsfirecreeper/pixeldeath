extends Node
var visible = true
var freddles = 0
var base_kill_interval = 20
var kill_interval = 20
var ai = 20
var freddle_spawn = false
var freddle_remove = false
var kill_progression = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	base_kill_interval = 10 if GameState.blood else 20 # Replace with function body.
	kill_interval = base_kill_interval

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	kill_progression += delta
	if freddle_remove:
		freddles -= 1
		freddle_render()
		freddle_remove = false
	if kill_progression >= kill_interval:	
		if GameState.blood:
			if freddles >= 1:
				Functions.jumpscare("Feddy") # Replace with function body.
		else:
			if randi() % 8 < freddles:
				Functions.jumpscare("Feddy")
		kill_progression -= kill_interval
	if freddle_spawn:
		freddles += 1
		freddles = clamp(freddles, 0, 8)
		freddle_render()
		freddle_spawn = false
	if GameState.temp > 90:
		kill_interval = base_kill_interval - ((GameState.temp - 90) * 0.5)
		if GameState.blood:
			kill_interval = max(kill_interval, 0.1)
		else:
			kill_interval = max(kill_interval, 5)
	else:
		kill_interval = base_kill_interval

func _on_freddle_timer_timeout() -> void:
	if randi() % 20 < ai:
		freddle_spawn = true


func _on_freddle_removal_timer_timeout() -> void:
	if GameState.temp <= 55:
		freddle_remove = true
func freddle_render() -> void:
		for i in range(1, 9):
			var freddle = get_node("Freddles/Freddle" + str(i))
			if i <= freddles && visible:
				freddle.visible = true
			else:
				freddle.visible = false


func _on_main_not_office() -> void:
	visible = false # Replace with function body.
	freddle_render()

func _on_main_office() -> void:
	visible = true # Replace with function body.
	freddle_render()
