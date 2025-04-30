extends CharacterBody2D

const SPEED := 25

func _ready() -> void:
	randomize()
	reset_ball()
	
	
func _physics_process(delta: float) -> void:
	var collision := move_and_collide(velocity)
	if collision:
		var normal := collision.get_normal()
		velocity = velocity.bounce(normal)
	

func reset_ball():
	position = Vector2(0, 0)
	
	var angle = randf_range(-PI / 4, PI / 4)
	var direction = Vector2(cos(angle), sin(angle))
	
	if randi() % 2 == 0:
		direction.x *= -1
		
	
	velocity = direction.normalized() * SPEED
