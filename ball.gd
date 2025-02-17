extends RigidBody2D
var speed = 500
var velocity = Vector2.ZERO
var angle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	angle = [randf_range(-PI/4, PI/4), randf_range(3*PI/4, 5*PI/4)].pick_random()
	velocity.x = speed * cos(angle)
	velocity.y = speed * sin(angle)
	velocity = velocity.normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		speed = 600
		velocity = velocity.bounce(collision_info.get_normal())
	position += velocity * speed * delta
