extends Node
class_name GetHitComponent

@export var my_mesh:MeshInstance3D

func _ready():
	owner.add_to_group("obstacle")

func get_hit() -> void:
	my_mesh.mesh.surface_get_material(0).albedo_color = Color.RED
	owner.remove_from_group("obstacle")
