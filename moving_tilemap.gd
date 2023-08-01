extends TileMap

@onready var move_speed: float = -Globals.wall_speed

@onready var rect: Rect2i = self.get_used_rect()

func _process(delta):
	position.x += move_speed * delta
	if position.x + rect.size.x <= 0:
		position.x = 0
