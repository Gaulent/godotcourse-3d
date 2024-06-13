extends Node

@export var Levels: Array[PackedScene]

var currentLevel = 0

# Called when the node enters the scene tree for the first time.
func reset_level():
	await get_tree().create_timer(1).timeout
	get_tree().reload_current_scene()

func next_level():
	await get_tree().create_timer(1).timeout
	currentLevel = (currentLevel + 1) % len(Levels)
	get_tree().change_scene_to_packed(Levels[currentLevel])
	
	