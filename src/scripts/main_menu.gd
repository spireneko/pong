extends MarginContainer

@onready var max_score_spin_box := $MarginContainer/HBoxContainer/Settings/HBoxContainer/MaxScoreSpinBox
@onready var singleplayer_check_box := $MarginContainer/HBoxContainer/Settings/HBoxContainer2/SingleplayerCheckBox


func _ready():
	if Global.config != null:
		max_score_spin_box.value = Global.config.get_value("Game Properties", "Max score")
		singleplayer_check_box.button_pressed = Global.config.get_value("Game Properties", "Singleplayer mode")

func _on_start_button_pressed():
	get_tree().paused = false
	if Global.config == null:
		Global.config = ConfigFile.new()
	Global.config.set_value("Game Properties", "Max score", max_score_spin_box.value)
	Global.config.set_value("Game Properties", "Singleplayer mode", singleplayer_check_box.button_pressed)
	get_tree().change_scene_to_file("res://src/scenes/arena.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
