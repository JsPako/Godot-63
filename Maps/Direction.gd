extends AnimatedSprite2D


func _process(delta):
	if GameState.waveOngoing == false && GameState.waveFinished == true:
		self.visible = true
	else:
		self.visible = false
