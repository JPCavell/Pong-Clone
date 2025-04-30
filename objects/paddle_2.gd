extends CharacterBody2D

var ball : CharacterBody2D
const SPEED := 400

func _ready() -> void:
	ball = get_parent().get_node("BallBody2D")
	
	
func _physics_process(delta: float) -> void:
	var dir_y = sign(ball.global_position.y /1.3 - global_position.y /1.31)
	
	velocity = Vector2(0, dir_y * SPEED)
	
	move_and_slide()
