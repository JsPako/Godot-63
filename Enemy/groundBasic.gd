extends CharacterBody2D

var speed = 100
var damage = 1
var health = 15
var airunit = false
var armor = 0

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	if get_parent().get_progress_ratio() > 0.99:
		GameState.health = GameState.health - damage
		get_parent().get_parent().queue_free()
	
	if health == 0:
		get_parent().get_parent().queue_free()
