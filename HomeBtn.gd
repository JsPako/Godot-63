extends Button

func _on_pressed():
	get_tree().change_scene_to_file("res://Maps/Main Menu/MainMenu.tscn")
	get_tree().paused = false
