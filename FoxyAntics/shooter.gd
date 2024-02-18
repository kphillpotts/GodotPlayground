extends Node2D

@onready var sound = $Sound
@onready var shoot_timer = $ShootTimer

var _can_shoot: bool = true

@export var speed: float = 50.0
@export var life_span: float = 10
@export var bullet_key: ObjectMaker.BULLET_KEY
@export var shoot_delay: float = 0.7

func _ready():
	shoot_timer.wait_time = shoot_delay

func shoot(direction: Vector2) -> void:
	if _can_shoot == false:
		return
	
	_can_shoot = false
	SoundManager.play_clip(sound, SoundManager.SOUND_LASER)
	ObjectMaker.create_bullet(speed, direction, life_span, global_position, bullet_key)
	shoot_timer.start()

func _on_shoot_timer_timeout():
	_can_shoot = true
