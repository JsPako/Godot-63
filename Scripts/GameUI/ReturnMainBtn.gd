extends Button

func _on_pressed():
	get_parent().visible = false
	get_parent().get_parent().get_node("Menu Background").visible = true
