extends CharacterBody2D


const SPEED = 175.0
const JUMP_VELOCITY = -275.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D2

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	
	
		
	if direction:
		velocity.x = direction * SPEED
		
		#flip animation
		if direction < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		
			
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	if is_on_floor():
		if direction == 0:
			sprite.play("Idle")
		else:
			sprite.play("Run")
	else:
		sprite.play("Jump")
	if Input.is_action_just_pressed("ui_up"):
		sprite.play("Jump")
		
	move_and_slide()
