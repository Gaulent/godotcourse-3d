extends RigidBody3D

@onready var my_mesh : MeshInstance3D = $MeshInstance3D
@onready var trap: Area3D = $Trap

func _ready() -> void:
	add_to_group("obstacle")
	trap.body_entered.connect(enable_ball)

func get_hit() -> void:
	my_mesh.mesh.surface_get_material(0).albedo_color = Color.RED
	remove_from_group("obstacle")

func enable_ball(node: Node3D):
	if node is Player:
		freeze = false
		trap.set_deferred("monitoring", false)
