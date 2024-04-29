extends StaticBody3D

@onready var my_mesh : MeshInstance3D = $MeshInstance3D

func _ready() -> void:
	add_to_group("obstacle")

func get_hit() -> void:
	my_mesh.mesh.surface_get_material(0).albedo_color = Color.RED
	remove_from_group("obstacle")