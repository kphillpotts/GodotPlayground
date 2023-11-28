extends RigidBody2D

var _dead: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	update_debug_label()

func update_debug_label() -> void:
	var s = "g_pos: %s\n" % Utils.vect2_to_str(global_position)
	s+= "ang: %.1f\nlinear: %s" % [angular_velocity, Utils.vect2_to_str(linear_velocity)]
	SignalManager.on_update_debug_label.emit(s)


func _on_screen_exited():
	die()
	
func die() -> void:
	if _dead == true:
		return
	_dead = true
	SignalManager.on_animal_died.emit()
	queue_free()
