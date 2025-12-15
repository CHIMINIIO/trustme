extends CharacterBody2D

@export var speed = 50.0
@export var drag  = 1.0
@export var decel  = 0.0

var is_decelerating = true

func _ready():
	Globals.player_pos = position
	Globals.player_vel = velocity

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	if input_direction:
		is_decelerating = false
		var k = position + 999999*Vector2(-input_direction.y, input_direction.x)
		look_at(k)
		velocity += input_direction * speed * ((3/2) - (input_direction.dot(velocity.normalized()))/2)
	else:
		is_decelerating = true
		
		
func _physics_process(delta):
	Globals.player_pos = position
	Globals.player_vel = velocity
	velocity = (1 - delta*drag)*velocity
	if is_decelerating:
		velocity = (1 - delta*decel)*velocity
	
	get_input()
	var collision_info = move_and_collide(velocity*delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
