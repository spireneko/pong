extends RigidBody2D

const SPEED := 500

@export var player_control := PlayerControl.ArrowPlayer

var velocity : Vector2

enum PlayerControl {
	WasdPlayer,
	ArrowPlayer
}

func _physics_process(delta: float) -> void:
	move_and_collide(velocity * SPEED * delta)


func _unhandled_key_input(_event: InputEvent) -> void:
	if player_control == PlayerControl.ArrowPlayer:
		velocity = Vector2(0, Input.get_axis("ui_up", "ui_down"))
	elif player_control == PlayerControl.WasdPlayer:
		velocity = Vector2(0, Input.get_axis("Up", "Down"))


func _on_body_entered(body):
	if body is RigidBody2D:
		body.apply_bounce_velocity(velocity)
