extends Node

signal restart_requested

@onready var right_score := $RightScore
@onready var left_score := $LeftScore
@onready var time := $Time
@onready var gameover_menu := $GameOverMenu
@onready var winner_label := $GameOverMenu/MarginContainer/VBoxContainer/WinnerLabel

func _ready():
	reset()

func reset():
	set_time(0)
	set_score(Vector2.ZERO)
	gameover_menu.hide()

func set_time(current_time: int):
	var hours := current_time / 3600
	current_time %= 3600
	var minutes := current_time / 60
	var seconds = current_time % 60
	var result := ""
	if hours:
		result += str(hours) + ":"
	result += "%02d" % minutes + ":" + "%02d" % seconds
	time.text = result

func set_score(new_score: Vector2):
	left_score.text = str(new_score.x)
	right_score.text = str(new_score.y)

func call_gameover_menu(winner: Global.Winner):
	match winner:
		Global.Winner.LEFT:
			winner_label.text = "Left player wins!"
		Global.Winner.RIGHT:
			winner_label.text = "Right player wins!"
	
	gameover_menu.show()

func _on_quit_button_pressed():
	get_tree().quit()


func _on_restart_button_pressed():
	get_tree().paused = false
	emit_signal("restart_requested")

