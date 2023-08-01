extends CharacterBody2D

signal dead(pos)

const SPEED = 300.0
const JUMP_VELOCITY = -450.0 
const GRAVITY_SCALE = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var icon = $Icon
@onready var dust_particles = $DustParticles

func _physics_process(delta):
	# Add gravity
	velocity.y += gravity * delta * GRAVITY_SCALE
	handle_animation()
	handle_jump()
	move_and_slide()

func _process(_delta):
	if global_position.y >= 368:
		# Die
		dead.emit(global_position)

func handle_animation():
	if velocity.y > 0:
		icon.play("fall")
	else:
		icon.play("jump")

func handle_jump():
	if Input.is_action_just_pressed("jump"): 
		velocity.y = JUMP_VELOCITY
		dust_particles.position = global_position
		dust_particles.play("dust")
