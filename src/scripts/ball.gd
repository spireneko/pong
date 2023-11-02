extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_central_impulse(Vector2(1, 0) * 1000)

func _physics_process(delta: float) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
