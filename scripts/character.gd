class_name Character
extends CharacterBody2D

@export var speed: float = 190.0

# Add patrol points to the scene
@export var patrol: Patrol = null

@onready var sprite: AnimatedSprite2D = $Sprite

@onready var behavior_tree: BeehaveTree = $BehaviorTree

var direction := Vector2.ZERO

var draw_callbacks: Array[Callable] = []

func _ready() -> void:
	# Make sure to add your enemy to a group if needed for conditions
	add_to_group("characters")
	
	# Set up patrol points in the move_to_patrol_point script
	behavior_tree.blackboard.set_value(&"patrol", patrol)

func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	
	move_and_slide()

func _draw() -> void:
	for callback: Callable in draw_callbacks:
		callback.call()
	
	draw_callbacks.clear()

func attack() -> void:
	sprite.play(&"attack")
