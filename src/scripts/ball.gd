extends RigidBody2D

const START_SPEED := 500
var speed := START_SPEED
var reset_state_position := false
var temp_pos : Vector2
var reset_state_linear_velocity := false
var temp_linear_velocity : Vector2
var reset_state_apply_impulse := false
var temp_impulse : Vector2

func _ready() -> void:
	linear_damp_mode = RigidBody2D.DAMP_MODE_REPLACE
	linear_damp = 0

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if reset_state_position:
		state.transform = Transform2D(0.0, temp_pos)
		reset_state_position = false
	
	if reset_state_linear_velocity:
		state.linear_velocity = temp_linear_velocity
		reset_state_linear_velocity = false
	
	if reset_state_apply_impulse:
		state.apply_central_impulse(temp_impulse)
		reset_state_apply_impulse = false

func set_physics_position(new_position: Vector2):
	temp_pos = new_position
	reset_state_position = true

func set_physics_linear_velocity(new_linear_velocity: Vector2):
	temp_linear_velocity = new_linear_velocity
	reset_state_linear_velocity = true

func call_apply_central_impulse(impulse: Vector2):
	temp_impulse = impulse
	reset_state_apply_impulse = true

func apply_bounce_velocity(velocity: Vector2):
	speed += 50
	linear_velocity = (linear_velocity.normalized() + velocity * 0.2).normalized() * speed

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("walls"):
		body.emit_signal("ball_touched")
