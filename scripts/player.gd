extends CharacterBody2D

@export var speed: float = 200.0

@onready var sprite: AnimatedSprite2D = $Sprite

var direction: Vector2 = Vector2.ZERO

func _process(_delta: float) -> void:
	if velocity.x < 0.0:
		sprite.flip_h = true
	elif velocity.x > 0.0:
		sprite.flip_h = false
	
	if velocity.abs() > Vector2.ZERO:
		sprite.play(&"walk")
	else:
		sprite.play(&"idle")

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * speed
	
	move_and_slide()
