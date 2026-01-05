@tool
class_name ChasePlayer
extends ActionLeaf

@export var max_distance: float = 128.0

@export var min_distance: float = 16.0

func tick(actor: Node, blackboard: Blackboard) -> int:
	var character := actor as Character
	var player := blackboard.get_value(&"player", null) as CharacterBody2D
	
	if not player: return FAILURE
	
	var player_position := player.global_position
	
	var distance := character.global_position.distance_to(player_position)
	
	if distance > max_distance:
		character.direction = Vector2.ZERO
		
		return FAILURE
	if distance <= min_distance:
		character.direction = Vector2.ZERO
		
		return SUCCESS
	
	var direction := character.global_position.direction_to(player_position)
	
	# Move toward player
	character.direction = direction
	
	# Still chasing
	return RUNNING
