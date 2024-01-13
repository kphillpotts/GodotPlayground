extends Control

@onready var music_volume = $NinePatchRect/MarginContainer/VBoxContainer/HBoxContainer/MusicVolume

# Called when the node enters the scene tree for the first time.
func _ready():
	music_volume.value = GameManager.music_volume
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_music_volume_value_changed(value):
	GameManager.music_volume = value
	SignalManager.on_volume_changed.emit()


func _on_close_button_pressed():
	hide()
