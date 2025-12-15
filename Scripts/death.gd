extends Area2D

signal hit

@export var is_flank = false
@export var speed    = 300

func sigmoid(x):
	return ((exp(x)/(exp(x)+1)) - 0.5)

func _ready():
	body_entered.connect(_on_body_entered)

func _process(delta):
	var target = null
	if is_flank:
		target = Globals.player_pos + (Globals.player_vel * 100 * sigmoid(position.distance_to(Globals.player_pos) / 100) * delta)
	else:
		target = Globals.player_pos
		
	position = position + (target - position).normalized() * delta * speed

func _on_body_entered(_ss):
	hit.emit()
