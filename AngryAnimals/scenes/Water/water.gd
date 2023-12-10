extends Area2D

@onready var splashed_sound = $SplashedSound


func _on_body_entered(body):
	if body.is_in_group("animal"):
		splashed_sound.play()
	
