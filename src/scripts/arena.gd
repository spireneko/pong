extends Node

@onready var hud := $HUD

var score := Vector2.ZERO

func _on_right_wall_ball_touched() -> void:
	score.x += 1
	hud

func _on_left_wall_ball_touched() -> void:
	score.y += 1
