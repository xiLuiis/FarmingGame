extends CharacterBody2D

var speed = 50
var motion = Vector2.ZERO 

func _physics_process(delta):
	motion = Vector2.ZERO  

	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
	if Input.is_action_pressed("ui_up"):
		motion.y = -speed
	if Input.is_action_pressed("ui_down"):
		motion.y = speed

	if motion != Vector2.ZERO:
		if motion.y < 0:	
			$AnimatedSprite2D.play("walking_up")
		elif motion.y > 0:
			$AnimatedSprite2D.play("walking_down")
		elif motion.x != 0:
			$AnimatedSprite2D.play("walking_side")
			$AnimatedSprite2D.flip_h = !(motion.x < 0)  
	else:
		$AnimatedSprite2D.play("idle")

	velocity = motion
	move_and_slide()
