extends RigidBody2D
var speed = 500
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity.x = randf_range(-1.0, 1.0)
	velocity.y = randf_range(-1.0, 1.0)
	velocity = velocity.normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
	position += velocity * speed * delta
