extends StaticBody2D

const SPEED := 500

var velocity : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	move_and_collide(velocity * delta * SPEED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_key_input(event: InputEvent) -> void:
	velocity = Vector2(0, Input.get_axis("ui_up", "ui_down"))
