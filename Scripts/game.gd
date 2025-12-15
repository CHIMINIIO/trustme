extends Node2D

func _on_game_restart() -> void:
	print("trying restart")
	get_tree().reload_current_scene()


func _on_restart() -> void:
	_on_game_restart()
