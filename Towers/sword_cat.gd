extends StaticBody2D

var damage = 1
var currentTargets = []
var current
var enemies = ["husky", "bunny", "goldenRetriever", "fox"]
var attackReload = 0

func _process(_delta):
	if current == null:
		get_node("AnimatedSprite2D").play("default")
	if is_instance_valid(current):
		if self.global_position.x < current.global_position.x:
			get_node("AnimatedSprite2D").set_flip_h(false)
			get_node("AnimatedSprite2D").set_offset(Vector2(0,0))
		else:
			get_node("AnimatedSprite2D").set_flip_h(true)
			get_node("AnimatedSprite2D").set_offset(Vector2(-12,0))
	else:
		get_node("AnimatedSprite2D").play("default")

func _physics_process(_delta):
		
	var tempArray = []
	
	for i in currentTargets:
		if is_instance_valid(i):
			if i.name in enemies:
				tempArray.append(i)
	
	var currentTarget = null
	for i in tempArray:
		if currentTarget == null:
			currentTarget = i.get_node("../")
		else:
			if i.get_parent().get_progress() > currentTarget.get_progress():
				currentTarget = i.get_node("../")
	
	current = currentTarget
	if current != null:
		if attackReload <= 0:
			attack(current)
			attackReload = 90
	attackReload = attackReload - 1
		
func _on_area_2d_body_entered(_body):
	currentTargets = get_node("Area2D").get_overlapping_bodies()
	
func _on_area_2d_body_exited(_body):
	currentTargets = get_node("Area2D").get_overlapping_bodies()

func attack(current):
	get_node("AnimatedSprite2D").play("attack")
	var enemy = current.get_child(0)
	enemy.health = enemy.health - damage
	
func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.get_animation() == "attack" and attackReload > 0:
		get_node("AnimatedSprite2D").play("default")
