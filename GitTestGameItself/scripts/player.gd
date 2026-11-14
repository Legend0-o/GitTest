extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
const SPEED = 120.0
var last_dir = "d"

func _physics_process(delta):
	var horizontal = Input.get_axis("move_left", "move_right")
	var vertical = Input.get_axis("move_up", "move_down")
	
	move(horizontal, vertical)
	move_anim(horizontal, vertical)
	move_and_slide()

func move(horizontal, vertical):
	if vertical != 0:
		velocity.y = vertical * SPEED
	else:
		velocity.y = 0

	if horizontal != 0:
		velocity.x = horizontal * SPEED
	else:
		velocity.x = 0

func move_anim(horizontal, vertical):
	if vertical < 0:
		last_dir = "u"
		animation_player.play("move_u")
	elif vertical > 0:
		last_dir = "d"
		animation_player.play("move_d")
	elif horizontal < 0:
		last_dir = "l"
		animation_player.play("move_l")
	elif horizontal > 0:
		last_dir = "r"
		animation_player.play("move_r")
	else:
		animation_player.play("idle_" + last_dir)
