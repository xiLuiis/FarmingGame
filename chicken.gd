extends CharacterBody2D

var eating = false
var walking = false

var xdir = 1 #1==right -1==left
var ydir = 1 #1==down -1==up
var speed = 5

var motion = Vector2()

var moving_vertical_horizontal = 1 # 1 == horizontal 2 == vertical

func _ready():
	randomize()
	var start_state = randi_range(1,2)
	var start_direction = randi_range(1,2)
	if start_state>1.5:
		eating=true
		walking=false
	else:
		walking=true
		eating=false
	if start_state>1.5:
		moving_vertical_horizontal = 1
	else:
		moving_vertical_horizontal = 2

func _physics_process(_delta: float) -> void:
	var _waittime = 1
	if walking == false:
		var x = randi_range(1,2)
		if x>1.5:
			moving_vertical_horizontal = 1
		else:
			moving_vertical_horizontal = 2
	if walking == true:
		$AnimatedSprite2D.play("walking")
		if moving_vertical_horizontal == 1:
			if xdir == -1:
				$AnimatedSprite2D.flip_h = true
			if xdir == 1:
				$AnimatedSprite2D.flip_h = false
			motion.x = speed * xdir
			motion.y = 0
		elif moving_vertical_horizontal == 2:
			motion.y = speed * ydir
			motion.x = 0
	if eating == true:
		$AnimatedSprite2D.play("eating")
		motion.x=0
		motion.y=0
	velocity=motion
	move_and_slide()
		
func _on_walkingtimer_timeout() -> void:
	var x = randi_range(1,2)
	var y = randi_range(1,2)
	var waittime = randi_range(1,4)
	
	if x > 1.5:
		xdir = 1
	else:
		xdir = -1
	if y > 1.5:
		ydir = 1
	else:
		ydir = -1
	$walkingtimer.wait_time = waittime
	$walkingtimer.start()

func _on_changestatetimer_timeout() -> void:
	var waittime = 1
	if walking == true:
		eating = true
		walking = false
		waittime = randi_range(1,5)
	elif eating == true:
		walking=true
		eating=false
		waittime = randi_range(2,6)
	$changestatetimer.wait_time = waittime
	$changestatetimer.start()
