extends Node2D

@onready var huskyPath = preload("res://Maps/Main Menu/MainMenuHuskyPath.tscn")
@onready var micePath = preload("res://Maps/Main Menu/MainMenuMicePath.tscn")
@onready var goldenRetrieverPath = preload("res://Maps/Main Menu/MainMenuGoldenRetrieverPath.tscn")
@onready var foxPath = preload("res://Maps/Main Menu/MainMenuFoxPath.tscn")

func _ready():
	spawnEnemy(huskyPath, 100000, 3)
	spawnEnemy(micePath, 100000, 8)
	spawnEnemy(goldenRetrieverPath, 100000, 5)
	spawnEnemy(foxPath, 100000, 10)

func spawnEnemy(_path, _amount, _gap):
	for n in _amount:
		var enemyPath = _path.instantiate()
		add_child(enemyPath)
		await get_tree().create_timer(_gap).timeout
