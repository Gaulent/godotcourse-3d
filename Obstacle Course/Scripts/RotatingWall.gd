extends StaticBody3D

@onready var my_mesh : MeshInstance3D = $MeshInstance3D
@export var rotation_speed:float = 0.5

func _ready() -> void:
	add_to_group("obstacle")

func get_hit() -> void:
	my_mesh.mesh.surface_get_material(0).albedo_color = Color.RED
	remove_from_group("obstacle")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process( delta: float, ) -> void:
	rotate(Vector3.UP, rotation_speed * PI * delta)
