extends Node2D

signal hit_player(pos)

func _physics_process(delta):
	position.x -= Globals.wall_speed * delta
	# Destroy when off screen
	if position.x < -100:
		queue_free()

func _on_wall_body_entered(body):
	hit_player.emit(body.global_position)

func level_up():
	Globals.level += 1

func _on_level_up_area_body_entered(_body):
	level_up()

# GODOT BUG
func _on_body_entered(_body):
	pass # Replace with function body.
