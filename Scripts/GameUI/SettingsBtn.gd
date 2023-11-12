extends Button

func _on_pressed():
	if get_tree().paused == false:
		get_tree().paused = true
		get_parent().get_node("Game Paused Background").visible = true
