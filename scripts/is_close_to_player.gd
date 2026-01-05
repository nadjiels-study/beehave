@tool
class_name IsCloseToPlayer
extends ConditionLeaf

@export var detection_range: float = 128.0

@export var debug_color: Color = Color.WHITE

var ticks: int = 0

func tick(actor: Node, blackboard: Blackboard) -> int:
	ticks += 1
	
	var character := actor as Character
	var player := _get_player(blackboard)
	
	if ticks == 1: _draw_range(character)
	
	if not player: return FAILURE
	
	var distance = character.global_position.distance_to(player.global_position)
	
	if distance > detection_range: return FAILURE
	
	return SUCCESS

func _get_player(blackboard: Blackboard) -> CharacterBody2D:
	var player := blackboard.get_value(&"player", null) as CharacterBody2D
	
	if not player: player = get_tree().get_first_node_in_group(&"player")
	if not player: return null
	
	blackboard.set_value(&"player", player)
	
	return player

func _draw_range(character: Character) -> void:
	character.draw_callbacks.push_back(
		func() -> void:
			character.draw_circle(
				Vector2.ZERO,
				detection_range,
				debug_color,
				false,
				1.0,
			)
	)
	
	character.queue_redraw()
