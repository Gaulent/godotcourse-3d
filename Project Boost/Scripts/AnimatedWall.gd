extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var start: Vector3 =  position
	var end: Vector3 = $Waypoint.get_global_position()
	var tween:= create_tween().set_loops()
	tween.tween_property(self, "position", end, 5).from(start).set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "position", start, 5).from(end).set_trans(Tween.TRANS_SINE)
