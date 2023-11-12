extends Label

func _process(_delta):
	var coins = GameState.coins
	text = str(coins)
