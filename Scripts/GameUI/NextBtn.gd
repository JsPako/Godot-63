extends Button

func _process(delta):
	if GameState.waveOngoing == false && GameState.waveFinished == true:
		get_parent().visible = true
	else:
		get_parent().visible = false
		
func _on_pressed():
	if GameState.waveOngoing == false && GameState.waveFinished == true:
		GameState.waveStart = true
