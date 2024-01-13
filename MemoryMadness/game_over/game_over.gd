extends Control

@onready var moves_label = $NinePatchRect/MC/VB/HB/MovesLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_game_over.connect(on_game_over)



func on_game_over(moves: int) -> void:
	moves_label.text = "%s" % moves
	show()

func _on_exit_button_pressed():
	hide()
	SignalManager.on_game_exit_pressed.emit()
