extends Node

@onready var hud := $HUD

var score := Vector2.ZERO
var playtime := 0.0

func _physics_process(delta):
	playtime += delta
	hud.set_time(int(playtime))


func _on_right_wall_ball_touched() -> void:
	score.y += 1
	hud.left_score.text = str(score.y)

func _on_left_wall_ball_touched() -> void:
	score.x += 1
	hud.right_score.text = str(score.x)
