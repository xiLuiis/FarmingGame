extends CharacterBody2D

var speed = 50
var motion = Vector2.ZERO 

func _physics_process(delta):
	var motion = Vector2.ZERO 
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("walking_side")
		motion.x=speed
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("walking_side")
		motion.x=-speed
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite2D.play("walking_up")
		motion.y=-speed
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.play("walking_down")
		motion.y=speed
	else:
		$AnimatedSprite2D.play("idle")
	velocity=motion
	move_and_slide()
