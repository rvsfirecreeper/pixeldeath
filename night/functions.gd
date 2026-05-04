extends Node


# Called when the node enters the scene tree for the first time.
func jumpscare(name: String):
	GameState.anim = name
	get_tree().change_scene_to_file("res://death/death.tscn")
