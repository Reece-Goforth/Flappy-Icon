extends Sprite2D

@export var move_speed: float = -50.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += move_speed * delta
	if position.x + texture.get_width() <= 0:
		position.x = 0.0
