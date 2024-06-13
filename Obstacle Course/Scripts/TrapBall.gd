extends RigidBody3D

@onready var trap: Area3D = $Trap

func _ready() -> void:
	trap.body_entered.connect(enable_ball)

func get_hit() -> void:
	$GetHitComponent.get_hit()
	
func enable_ball(node: Node3D):
	if node is Player:
		freeze = false
		trap.queue_free()
