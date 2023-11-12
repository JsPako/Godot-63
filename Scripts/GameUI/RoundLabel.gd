extends Label

func _process(_delta):
	var current = GameState.stage
	var maxRound = GameState.maxStage
	text = str(current) + " / " + str(maxRound)
