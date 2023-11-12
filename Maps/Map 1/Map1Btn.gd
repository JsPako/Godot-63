extends Button

func _on_pressed():
	get_tree().change_scene_to_file("res://Maps/Map 1/map_1.tscn")
	get_tree().paused = false
