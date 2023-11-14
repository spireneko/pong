extends RigidBody2D

const START_SPEED := 750
var speed := START_SPEED

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	linear_damp_mode = RigidBody2D.DAMP_MODE_REPLACE
	linear_damp = 0
	apply_central_impulse(
		Vector2.LEFT.rotated(
			randf_range(deg_to_rad(-45), deg_to_rad(45))) * speed)

func apply_bounce_velocity(velocity: Vector2):
	speed += 50
	linear_velocity = (linear_velocity.normalized() + velocity * 0.2).normalized() * speed

#func _physics_process(delta):
#	print(linear_velocity)
#	print(linear_velocity.length())


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("walls"):
		body.emit_signal("ball_touched")
