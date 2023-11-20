extends Node

@onready var right_score := $RightScore
@onready var left_score := $LeftScore
@onready var time := $Time

func set_time(current_time: int):
	var hours := current_time / 3600
	current_time %= 3600
	var minutes := current_time / 60
	var seconds = current_time % 60
	var result: String
	if hours:
		result += str(hours) + ":"
	result += "%02d" % minutes + ":" + "%02d" % seconds
	time.text = result
