extends Node2D

@onready var wall_spawn_positions = $WallSpawnPositions
@onready var walls = $Walls
@onready var player = $Player
@onready var level_restart = $Timers/LevelRestart
@onready var death_effect: CPUParticles2D = $Particles/DeathEffect

@export var wall_scene: PackedScene

var spawn_markers: Array[Node]

func _ready():
	spawn_markers = wall_spawn_positions.get_children()


func _on_wall_spawn_timer_timeout():
	# Spawn wall
	var wall = wall_scene.instantiate()
	var selected_marker = spawn_markers[randi() % spawn_markers.size()]
	wall.position = selected_marker.global_position
	wall.connect("hit_player",player_die)
	walls.add_child(wall)

func player_die(pos):
	player.queue_free()
	level_restart.start()
	death_effect.position = pos
	death_effect.restart()

func _on_level_restart_timeout():
	Globals.level = 0
	get_tree().reload_current_scene()

# When the player is below the ground
func _on_player_dead(pos):
	player_die(pos)
