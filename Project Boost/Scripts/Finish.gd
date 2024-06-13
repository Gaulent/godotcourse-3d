extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area3D.body_entered.connect(check_win)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func check_win(node3d: Node3D):
	if node3d is Player:
		LevelManager.next_level()
