extends EnemyBase

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var turn_timer = $TurnTimer
@onready var player_detector = $PlayerDetector


const FLY_SPEED: Vector2 = Vector2(35, 15)
const TURN_WAIT_RANGE: Vector2 = Vector2(2.5,5)
var _fly_direction: Vector2 = Vector2.ZERO
var _allow_jump: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	super._physics_process(delta)
	velocity = _fly_direction
	move_and_slide()
	pass

func _on_visible_on_screen_notifier_2d_screen_entered():
	animated_sprite_2d.play("fly")
	fly_to_player()

func _on_turn_timer_timeout():
	set_and_flip()

func set_and_flip() -> void:
	var x_dir = sign(_player_ref.global_position.x - global_position.x)
	if x_dir > 0:
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false
	_fly_direction = Vector2(x_dir, 1) * FLY_SPEED
	
func fly_to_player() -> void:
	set_and_flip()
	turn_timer.start()
