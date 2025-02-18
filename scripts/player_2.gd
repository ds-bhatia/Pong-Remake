extends CharacterBody2D

var speed = 500
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
	velocity = velocity * speed
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
