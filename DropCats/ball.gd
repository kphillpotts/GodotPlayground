extends RigidBody2D

@export var ball_scale : float = 1
@onready var sprite = $Sprite2D
@onready var collission = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_ball_scale (scale : float):
	$Sprite2D.scale.x = .25 * scale
	$Sprite2D.scale.y = .25 * scale
	$CollisionShape2D.scale.x = 1 * scale
	$CollisionShape2D.scale.y = 1 * scale
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
