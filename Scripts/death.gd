extends Area2D

signal hit

@export var flanky      = 0.0
@export var speed       = 300
@export var sigmoid_div = 100

func sigmoid(x):
	return (exp(x)/(exp(x) + 1) - 1/2)*2

func sigmoid_normal(v):
	return v.normalized()*(sigmoid(sqrt(v.dot(v))))

func wproject(v, w):
	var x = w.normalized()
	return v.dot(x)*x

func _ready():
	body_entered.connect(_on_body_entered)

func _process(delta):
	var direct = (Globals.player_pos - position).normalized()
	var v = Globals.player_vel
	var k
	if direct.dot(v) >= 0:
		k = 0
	else:
		k = 1
	var w = ((1 - flanky)*direct + k*flanky*sigmoid_normal(wproject(direct, Vector2(-v.y, v.x))/sigmoid_div)).normalized()
	position = position + w * delta * speed

func _on_body_entered(_ss):
	hit.emit()
