extends Camera2D

@onready var ball = $BallBody2D
var Paddle_1_Score = 0
var Paddle_2_Score = 0


func _ready():
	$Left.body_entered.connect(_left_hit)
	$Right.body_entered.connect(_right_hit)
	
	

func _left_hit(body):
	if body == ball:
		Paddle_1_Score += 1
		$Control/Label2.text = str(Paddle_1_Score) 
		restart_round()
	
	
func _right_hit(body):
	if body == ball:
		Paddle_2_Score += 1
		$Control/Label.text = str(Paddle_2_Score)
		restart_round()

func restart_round():
	$CharacterBody2D.global_position.x = -952
	$CharacterBody2D2.global_position.x = 1048
	ball.reset_ball()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):  # Default action for Esc in Godot
		get_tree().quit()
