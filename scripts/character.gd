extends CharacterBody2D

@onready var behavior_tree: BeehaveTree = $BehaviorTree

# Add patrol points to the scene
@export var patrol: Patrol = null

func _ready():
	# Make sure to add your enemy to a group if needed for conditions
	add_to_group("characters")
	
	# Set up patrol points in the move_to_patrol_point script
	behavior_tree.blackboard.set_value(&"patrol", patrol)

func _physics_process(delta):
	# The behavior tree handles the movement logic, but you might need
	# additional code for animation, etc.
	pass
