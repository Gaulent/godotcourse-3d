extends Node3D

var score:int = 0

func _ready() -> void:
	$Player.on_touched_obstacle.connect(add_score)

func add_score():
	score+=1
	$Managers/UIManager.update_score(score)

