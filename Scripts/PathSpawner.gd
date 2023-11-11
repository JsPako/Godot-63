extends Node2D

@export var round = 1
@onready var path = preload("res://Maps/Map1Stage.tscn")

func _on_timer_timeout():
	if round == 1:
		spawnEnemy(path, 10, 1)
	if round == 2:
		spawnEnemy(path, 20, 0.3)
		

func spawnEnemy(path, amount, gap):
	for n in amount:
		var enemyPath = path.instantiate()
		add_child(enemyPath)
		await get_tree().create_timer(gap).timeout
