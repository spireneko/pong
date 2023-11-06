extends RigidBody2D

const SPEED := 750

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	linear_damp_mode = RigidBody2D.DAMP_MODE_REPLACE
	linear_damp = 0
	apply_central_impulse(
		Vector2.LEFT.rotated(
			randf_range(deg_to_rad(-45), deg_to_rad(45))) * SPEED)

func apply_bounce_velocity(velocity: Vector2):
	linear_velocity = (linear_velocity.normalized() + velocity * 0.2).normalized() * SPEED

#func _physics_process(delta):
#	print(linear_velocity)
#	print(linear_velocity.length())
