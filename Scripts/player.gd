extends CharacterBody2D

@export var speed = 40

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_direction:
		var k = position + Vector2(-input_direction.y, input_direction.x)
		look_at(k)
		velocity += input_direction * speed


func _physics_process(delta):
	velocity = (1 - delta*2)*velocity
	get_input()
	move_and_slide()
