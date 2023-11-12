extends Node2D

@onready var basic = preload("res://Maps/Main Menu/MainMenuBPath.tscn")
@onready var speedy = preload("res://Maps/Main Menu/MainMenuSPath.tscn")
func _ready():
	spawnEnemy(basic, 100000, 3)
	spawnEnemy(speedy, 100000, 8)

func spawnEnemy(_path, _amount, _gap):
	for n in _amount:
		var enemyPath = _path.instantiate()
		add_child(enemyPath)
		await get_tree().create_timer(_gap).timeout
