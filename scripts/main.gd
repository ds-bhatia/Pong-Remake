extends Node

var p1Score = 0
var p2Score = 0

func _ready() -> void:
	pass

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
