class_name Player
extends RigidBody3D

@export var ROTATION_SPEED: float = 10.0
@export var THRUSTER: float = 10.0
@export var MAX_SPEED: float = 10.0

func _ready() -> void:
	body_entered.connect(impact)

func _physics_process(delta):
	# Handle jump.
	if Input.is_action_pressed("thrust"):
		apply_force(transform.basis.y * THRUSTER)
		$Thurster.emitting = true
		if !$AudioThruster.playing:
			$AudioThruster.playing = true
	else:
		$AudioThruster.playing = false
		$Thurster.emitting = false

	var input_dir: float = Input.get_axis("turn_left", "turn_right")
	rotate_z(-input_dir * delta * ROTATION_SPEED)
	
	linear_velocity = linear_velocity.limit_length(MAX_SPEED)
	

func impact(body: Node):
	if body.is_in_group("Obstacle"):
		call_deferred("set_contact_monitor", false)
		LevelManager.reset_level()
