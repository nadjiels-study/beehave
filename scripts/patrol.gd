class_name Patrol
extends Node2D

func get_points() -> Array[Node2D]:
	var children: Array[Node] = get_children()
	
	var points: Array[Node2D] = []
	points.assign(children)
	
	return points
