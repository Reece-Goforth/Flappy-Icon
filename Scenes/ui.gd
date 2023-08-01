extends CanvasLayer

@onready var level = $Theme/Level

func update():
	level.text = str(Globals.level)

func _ready():
	Globals.connect("ui_update",update)
	update()
