extends CharacterBody2D

@onready var animation_player = $AnimationPlayer

const ACCELERATION := 130.0
const MAX_SPEED = 200.0
const FRICTION = 15.0

func _physics_process(delta):
	var horizontal = Input.get_axis("move_left", "move_right")
	var vertical = Input.get_axis("move_up", "move_down")
	
	if vertical != 0:
		velocity.y = move_toward(velocity.y, vertical * MAX_SPEED, ACCELERATION * delta * 60)
	else:
		velocity.y = move_toward(velocity.y, 0, FRICTION * delta * 60)
		
	if horizontal != 0:
		velocity.x = move_toward(velocity.x, horizontal * MAX_SPEED, ACCELERATION * delta * 60)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta * 60)
		
	move_and_slide()
	
	# --- ANIMĀCIJAS (If-Else loģika) ---
	if vertical < 0:
		animation_player.play("up")
	elif vertical > 0:
		animation_player.play("down")
	elif horizontal < 0:
		animation_player.play("left")
	elif horizontal > 0:
		animation_player.play("right")
