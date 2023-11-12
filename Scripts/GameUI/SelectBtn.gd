extends Button

func _on_pressed():
	get_parent().visible = false
	get_parent().get_parent().get_node("Map Select").visible = true
