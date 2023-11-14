extends RigidBody2D

const SPEED := 500

@export var player_control := PlayerControl.ArrowPlayer

enum PlayerControl {
	WasdPlayer,
	ArrowPlayer
}



var velocity : Vector2
var starting_x_pos : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	starting_x_pos = position.x
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
#	position.x = starting_x_pos
	move_and_collide(velocity * SPEED * delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_key_input(event: InputEvent) -> void:
	if player_control == PlayerControl.ArrowPlayer:
		velocity = Vector2(0, Input.get_axis("ui_up", "ui_down"))
	elif player_control == PlayerControl.WasdPlayer:
		velocity = Vector2(0, Input.get_axis("Up", "Down"))


func _on_body_entered(body):
	if body is RigidBody2D:
		body.apply_bounce_velocity(velocity)
