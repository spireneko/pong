extends Node

signal score_changed

@onready var hud := $HUD
@onready var ball := $Ball

const BALL_SPAWN_POS := Vector2(640, (720 - 570) + 570 / 2)

var max_score : int = 1
@export var score := Vector2.ZERO : set = _set_score
var playtime := 0.0
var winner : Global.Winner


func _ready():
	max_score = Global.config.get_value("Game Properties", "Max score")
	reset(Global.Winner.LEFT)

func _physics_process(delta):
	playtime += delta
	hud.set_time(int(playtime))

func reset(prev_winner: Global.Winner):
	print("reset")
	score = Vector2.ZERO
	playtime = 0.0
	hud.reset()
	var ball_start_pos := BALL_SPAWN_POS
	var ball_start_velocity : Vector2
	match prev_winner:
		Global.Winner.RIGHT:
			ball_start_pos.x -= 200
			ball_start_velocity = Vector2.RIGHT
		Global.Winner.LEFT:
			ball_start_pos.x += 200
			ball_start_velocity = Vector2.LEFT
	ball.set_physics_position(ball_start_pos)
	ball.set_physics_linear_velocity(Vector2.ZERO)
	ball.call_apply_central_impulse(ball_start_velocity.rotated(
			randf_range(deg_to_rad(-45), deg_to_rad(45))) * ball.speed)

func _on_right_wall_ball_touched() -> void:
	score.x += 1

func _on_left_wall_ball_touched() -> void:
	score.y += 1

func _set_score(new_score: Vector2):
	score = new_score
	emit_signal("score_changed")

func _on_score_changed():
	hud.set_score(score)
	if score.x >= max_score:
		winner = Global.Winner.LEFT
		hud.call_gameover_menu(winner)
		get_tree().paused = true
	if score.y >= max_score:
		winner = Global.Winner.RIGHT
		hud.call_gameover_menu(winner)
		get_tree().paused = true

func _on_hud_restart_requested():
	reset(winner)
