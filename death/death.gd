extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Message.text = (GameState.anim + " Got You.\nCouldn't be me.") # Replace with function body.
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://night/night.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
