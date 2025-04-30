extends CharacterBody2D

const SPEED := 450

func getYDir() -> float:
	return Input.get_action_strength("Button_S") - Input.get_action_strength("Button_W")

func _physics_process(delta: float) -> void:
	var dir :Vector2=Vector2(0, getYDir())
	velocity = dir * SPEED
	move_and_slide()
