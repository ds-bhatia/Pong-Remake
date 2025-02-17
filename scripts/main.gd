extends Node

var p1Score = 0
var p2Score = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	if $Ball.position.x > 0:
		p1Score += 1
		$P1Score.text = str(p1Score)
	else:
		p2Score += 1
		$P2Score.text = str(p2Score)
	$Ball.spawn_ball()
