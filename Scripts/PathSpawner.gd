extends Node2D

@onready var basicPath = preload("res://Maps/Map 1/Map1BPath.tscn")
@onready var speedyPath = preload("res://Maps/Map 1/Map1SPath.tscn")

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
		await spawnEnemy(basicPath, 10, 1)
		await spawnEnemy(speedyPath, 3, 2)
	if stage == 2:
		await spawnEnemy(basicPath, 300, 0.1)
		await spawnEnemy(speedyPath, 50, 0.5)
	GameState.waveOngoing = false

func spawnEnemy(_path, _amount, _gap):
	for n in _amount:
		var enemyPath = _path.instantiate()
		add_child(enemyPath)
		await get_tree().create_timer(_gap).timeout
