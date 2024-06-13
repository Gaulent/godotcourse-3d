extends Camera3D

@export var target: Node3D
var initial_position:=position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position = Vector3(initial_position.x + target.position.x,initial_position.y + target.position.y, initial_position.z) 
	pass
