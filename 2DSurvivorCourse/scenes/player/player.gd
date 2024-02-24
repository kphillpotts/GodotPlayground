extends CharacterBody2D

@export var MAX_SPEED:float = 200
@export var ACCELERATION_SMOOTHING: float = 225

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Input.get_vector("move_left" , "move_right" , "move_up" , "move_down")
	var target_velocity = direction * MAX_SPEED
	velocity = velocity.lerp(target_velocity , 1 - exp(-delta * ACCELERATION_SMOOTHING))
	move_and_slide() 
'''
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity = direction * MAX_SPEED
	move_and_slide()
'''

func get_movement_vector() -> Vector2:
	var movement_vector = Vector2.ZERO
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement)
		
