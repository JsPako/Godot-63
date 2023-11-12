extends Button

func _on_pressed():
	GameState.waveFinished = true
	GameState.waveOngoing = false
	GameState.waveStart = false
	
	GameState.stage = 0
	GameState.health = 100
	GameState.coins = 0
	
	get_tree().reload_current_scene()
	get_tree().paused = false
