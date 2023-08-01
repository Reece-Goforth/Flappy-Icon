extends Node

signal ui_update

var wall_speed: float = 200.0
var level: int = 0:
	set(_v):
		level = _v
		ui_update.emit()
