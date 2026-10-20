extends CharacterBody2D

@onready var player: CharacterBody2D = $"."
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

const ACCELERATION := 130.0
const MAX_SPEED = 200.0
const FRICTION = 15.0

enum FACING { UP, DOWN, LEFT, RIGHT }
var current_facing: FACING = FACING.DOWN

#--- MOVEMENT ---
func _physics_process(delta):
	var horizontal = Input.get_axis("move_left", "move_right")
	var vertical = Input.get_axis("move_up", "move_down")
	
	if vertical:
		velocity.x = move_toward(velocity.x, vertical * MAX_SPEED, ACCELERATION * delta * 60)
	elif horizontal:
		velocity.x = move_toward(velocity.x, horizontal * MAX_SPEED, ACCELERATION * delta * 60)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta * 60)
	
	move_and_slide()

	#--- ANIMATION STATE MACHINE ---
	match current_state:
		STATE.IDLE:
			if direction != 0:
				change_state(STATE.RUN)
		STATE.RUN:
			if direction == 0:
				change_state(STATE.IDLE)

func change_facing(new_state: FACING):
	current_facing = new_state
	match current_facing:
		FACING.UP:
			animation_player.play("up")
		FACING.DOWN:
			animation_player.play("down")
		FACING.LEFT:
			animation_player.play("left")
		FACING.RIGHT:
			animation_player.play("right")
