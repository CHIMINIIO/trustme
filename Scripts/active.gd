extends Node2D

signal restart

func _on_restart():
	restart.emit()
