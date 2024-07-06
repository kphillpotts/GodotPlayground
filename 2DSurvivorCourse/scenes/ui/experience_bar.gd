extends CanvasLayer

@export var experience_manager : Node
@onready var progress_bar = $MarginContainer/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	progress_bar.value = 0
	experience_manager.experience_updated.connect(on_experience_updated) # Replace with function body.

func on_experience_updated(current_experience: float, target_experience: float):
	print ("Exp: ", current_experience, ", ", target_experience)
	var percent = current_experience / target_experience
	progress_bar.value = percent


