extends Node2D

@export var stage = 1
@onready var path = preload("res://Maps/Map1Stage.tscn")

func _on_timer_timeout():
	if stage == 1:
		spawnEnemy(path, 10, 1)
	if stage == 2:
		spawnEnemy(path, 20, 0.3)
		

func spawnEnemy(_path, _amount, _gap):
	for n in _amount:
		var enemyPath = _path.instantiate()
		add_child(enemyPath)
		await get_tree().create_timer(_gap).timeout
