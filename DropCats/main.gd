extends Node2D

@export var ballModel : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	

	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var scale = randf_range(.25, 1)
		var pos = get_global_mouse_position()
		
		var newBall = ballModel.instantiate()
		newBall.set_ball_scale (scale)
		add_child(newBall)
		newBall.position = pos
	pass
