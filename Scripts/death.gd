extends Area2D

signal hit

func _ready():
	body_entered.connect(_on_body_entered)

func _process(delta):
	position = position + (Globals.player_pos - position).normalized() * delta * 300

func _on_body_entered(_ss):
	hit.emit()
