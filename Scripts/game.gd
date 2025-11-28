extends Node2D

func _on_game_restart() -> void:
	get_tree().reload_current_scene()
