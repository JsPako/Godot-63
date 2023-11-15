extends Node2D

@onready var fox = preload("res://Maps/Map 1/Paths/Map1FoxPath.tscn")
@onready var bunny = preload("res://Maps/Map 1/Paths/Map1BunnyPath.tscn")
@onready var golden = preload("res://Maps/Map 1/Paths/Map1GRetrieverPath.tscn")
@onready var bird = preload("res://Maps/Map 1/Paths/Map1BirdPath.tscn")
@onready var husky = preload("res://Maps/Map 1/Paths/Map1HuskyPath.tscn")
@onready var rott = preload("res://Maps/Map 1/Paths/Map1RottweilerPath.tscn")
@onready var bear = preload("res://Maps/Map 1/Paths/Map1BearPath.tscn")


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
		await spawnEnemy(bunny, 5, 1.2)
	if stage == 2:
		await spawnEnemy(bunny, 5, 1)
		await spawnEnemy(bunny, 3, 0.7)
	if stage == 3:
		await spawnEnemy(bunny, 8, 0.6)
		await get_tree().create_timer(3).timeout
		await spawnEnemy(bunny, 10, 0.4)
	if stage == 4:
		await spawnEnemy(bunny, 12, 0.4)
		await get_tree().create_timer(1.5).timeout
		await spawnEnemy(bunny, 10, 0.3)
	if stage == 5:
		await spawnEnemy(bunny, 15, 0.3)
		await get_tree().create_timer(1).timeout
		await spawnEnemy(bunny, 20, 0.1)
	if stage == 6:
		pass
	if stage == 7:
		pass
	if stage == 8:
		pass
	if stage == 9:
		pass
	if stage == 10:
		pass
	if stage == 11:
		pass
	if stage == 12:
		pass
	if stage == 13:
		pass
	if stage == 14:
		pass
	if stage == 15:
		pass
	if stage == 16:
		pass
	if stage == 17:
		pass
	if stage == 18:
		pass
	if stage == 19:
		pass
	if stage == 20:
		pass
	GameState.waveOngoing = false

func spawnEnemy(_path, _amount, _gap):
	for n in _amount:
		var enemyPath = _path.instantiate()
		add_child(enemyPath)
		await get_tree().create_timer(_gap).timeout
