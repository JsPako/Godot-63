extends CharacterBody2D

var speed = 120
var damage = 6
var health = 8

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	
	if get_parent().get_progress_ratio() > 0.99:
		GameState.health = GameState.health - damage
		get_parent().get_parent().queue_free()

	if health <= 0:
		speed = 0
		$AnimatedSprite2D.play("death")
		

func _on_animated_sprite_2d_animation_finished():
	if health > 0:
		$AnimatedSprite2D.play("default")
	if $AnimatedSprite2D.get_animation() == "death":
		get_parent().get_parent().queue_free()
	
