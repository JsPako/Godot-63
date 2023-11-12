extends Button

func _on_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		get_parent().get_parent().visible = false
