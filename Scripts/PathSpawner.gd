extends Node2D

@onready var path = preload("res://Maps/Map 1/Map1Stage.tscn")

func _ready():
	GameState.stage = 0
	GameState.waveOngoing = false
	GameState.waveFinished = true
	GameState.waveStart = false
	GameState.gameOver = false
	GameState.maxStage = 20
	GameState.health = 100
	GameState.coins = 20

func _process(delta):
	if GameState.waveStart == true && GameState.waveFinished == true:
		GameState.waveStart = false
		GameState.stage = GameState.stage + 1
		await waveStart()
		
	var count = self.get_child_count()
	
	if count == 0 && GameState.waveOngoing == false:
		GameState.waveFinished = true
		
	

func waveStart():
	GameState.waveOngoing = true
	GameState.waveFinished = false
	var stage = GameState.stage

	if stage == 1:
		await spawnEnemy(path, 10, 1)
	if stage == 2:
		await spawnEnemy(path, 300, 0.1)
		await spawnEnemy(path, 50, 0.5)
	GameState.waveOngoing = false

func spawnEnemy(_path, _amount, _gap):
	for n in _amount:
		var enemyPath = _path.instantiate()
		add_child(enemyPath)
		await get_tree().create_timer(_gap).timeout
