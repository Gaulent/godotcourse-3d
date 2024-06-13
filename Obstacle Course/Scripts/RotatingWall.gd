extends StaticBody3D

@export var rotation_speed:float = 0.5


func get_hit() -> void:
	$GetHitComponent.get_hit()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process( delta: float, ) -> void:
	rotate(Vector3.UP, rotation_speed * PI * delta)
