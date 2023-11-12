extends Label

func _process(_delta):
	var health = GameState.health
	text = str(health)
