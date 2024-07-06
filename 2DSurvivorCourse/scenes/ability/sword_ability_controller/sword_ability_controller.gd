extends Node

@export var sword_ability: PackedScene
@onready var timer = $Timer
var damage = 5

const MAX_RANGE = 75

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timeout.connect(on_timer_timeout)


func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	# get the array of enemies
	var enemies = get_tree().get_nodes_in_group("enemy")
	# filter out all enemies greater than MAX_RANGE
	enemies = enemies.filter(func(enemy: Node2D):
		return enemy.global_position.distance_squared_to(player.global_position) < pow(MAX_RANGE, 2)
	)	
	
	if enemies.size() == 0:
		return
	
	# sort by distance to player
	enemies.sort_custom(func(a: Node2D, b: Node2D) :
		var a_distance = a.global_position.distance_squared_to(player.global_position)
		var b_distance = b.global_position.distance_squared_to(player.global_position)
		return a_distance < b_distance
	)
	
	
	
	var sword_instance = sword_ability.instantiate() as SwordAbility
	player.get_parent().add_child(sword_instance)
	sword_instance.hitbox_component.damage = damage
	sword_instance.global_position = enemies[0].global_position
	sword_instance.global_position += Vector2.RIGHT.rotated(randf_range(0, TAU)) * 4
	
	# get the direction vector between the eneemy and the sword
	var enemy_direction = enemies[0].global_position - sword_instance.global_position
	sword_instance.rotation = enemy_direction.angle()
