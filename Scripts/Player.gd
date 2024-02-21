extends CharacterBody2D


const SPEED = 150.0

enum PLAYER_STATE {
	MOVE,
	ATTACK
}

# Global nodes
@onready var anim = get_node("AnimationPlayer")
@onready var sprite = get_node("AnimatedSprite2D")
@onready var state = PLAYER_STATE.MOVE

func _physics_process(delta):
	match state:
		PLAYER_STATE.MOVE:
			on_move(delta)
		PLAYER_STATE.ATTACK:
			on_attack()
	
func on_move(delta):
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = velocity.normalized()
	
	var direction = Input.get_axis("ui_left", "ui_right")
	# Set animation direction
	if direction == -1:
		sprite.flip_h = true
	elif direction == 1:
		sprite.flip_h = false
	
	if velocity:
		anim.play("Run")
	else:
		anim.play("Idle")
	
	velocity *= SPEED
	move_and_slide()
	
	if Input.is_key_pressed(KEY_SPACE):
		state = PLAYER_STATE.ATTACK

func on_attack():
	anim.play("Attack")

func on_attack_exit():
	state = PLAYER_STATE.MOVE
