extends RigidBody2D
@export var speed = 500
var velocity = Vector2.ZERO
var angle

func _ready() -> void:
	spawn_ball(0,0)
	
func _process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		speed += 50
		velocity = velocity.bounce(collision_info.get_normal())
	position += velocity * speed * delta

func spawn_ball(p1Score, p2Score):
	speed = 500 + 15*(p1Score+p2Score)
	position = Vector2(578, 320)
	$RestartTimer.start()

func _on_restart_timer_timeout():
	position = Vector2(578, 320)
	angle = [randf_range(-PI/4, PI/4), randf_range(3*PI/4, 5*PI/4)].pick_random()
	velocity.x = speed * cos(angle)
	velocity.y = speed * sin(angle)
	velocity = velocity.normalized()
