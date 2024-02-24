extends Camera2D

var target_position = Vector2.ZERO
var camera_pos_x : int
var camera_pos_y : int

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	aquire_target()
	global_position = global_position.lerp(target_position , 1.0 - exp(-delta * 20))	
func aquire_target():
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		var player = player_nodes[0] as Node2D
		target_position = player.global_position
	

