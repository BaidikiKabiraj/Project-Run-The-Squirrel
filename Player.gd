extends CharacterBody2D


var player
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = get_node("AnimationPlayer")

func _ready():
	anim.play("Idle")
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var _direction = Input.get_axis("ui_left", "ui_right")
	
	if(_direction == -1):
		get_node("AnimatedSprite2D").flip_h = true
	elif(_direction == 1):
		get_node("AnimatedSprite2D").flip_h = false
	if _direction:
		velocity.x = _direction * SPEED
		if velocity.y == 0:
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("Idle")

	if(velocity.y > 0):
		anim.play("Fall")
	move_and_slide()
	
	if Game.playerHP <= 0:
		Game.Gold = 0
		Game.playerHP = 10
		queue_free()
		get_tree().change_scene_to_file("res://end.tscn")

	player = get_node("../../Player/Player")
	if(player.position.y >= 900 ):
		Game.Gold = 0
		Game.playerHP = 10
		queue_free()
		get_tree().change_scene_to_file("res://end.tscn")
	if(player.position.x >= 4900 ):
		Game.Gold = 0
		Game.playerHP = 10
		
		queue_free()
		get_tree().change_scene_to_file("res://won.tscn")
