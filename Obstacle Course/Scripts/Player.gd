class_name Player
extends CharacterBody3D

@export var SPEED: float        = 5.0
@export var ACCELERATION: float = 4.0

signal on_touched_obstacle

func _physics_process(delta):

	var input: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction: Vector3 = Vector3(input.x,0,input.y) * SPEED;	

	velocity = lerp(get_real_velocity(), direction,delta * ACCELERATION)

	move_and_slide()

	# Cogido para gestionar interaccion de kinematic con rigidbody		
	for col_idx in get_slide_collision_count():
		var col := get_slide_collision(col_idx)
		if col.get_collider() is RigidBody3D:
			col.get_collider().apply_central_impulse(-col.get_normal() * 0.3)
			#col.get_collider().apply_impulse(-col.get_normal() * 0.01, col.get_position())
		if col.get_collider().is_in_group("obstacle"):
			col.get_collider().get_hit()
			on_touched_obstacle.emit()
