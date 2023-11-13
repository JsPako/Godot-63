extends PathFollow2D

func _process(delta):
	if get_progress() > 1698:
		get_child(0).get_node("AnimatedSprite2D").set_flip_v(true)
