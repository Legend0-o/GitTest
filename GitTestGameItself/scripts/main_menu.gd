extends Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Main_Game_Scenes/game.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Start_Menu_Scenes/SaveControlMenu.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
