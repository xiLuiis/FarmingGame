extends StaticBody2D

var plant = Global.plantSelected
var plantgrowing = false
var plant_grown = false

func _ready():
	$plant.play("none")

func _physics_process(delta):
	if not plantgrowing:
		plant = Global.plantSelected

func _on_area_2d_area_entered(area):
	print("so true")
	if not plantgrowing:
		if plant == 0:
			print("No valid plant")
			$plant.play("none")
		if plant == 1:
			print("carrot")
			plantgrowing = true
			$carrotgrowtimer.start()
			$plant.play("carrot")
		if plant == 2:
			print("onion")
			plantgrowing = true
			$oniongrowtimer.start()
			$plant.play("onion")
		if plant == 3:
			print("No made this function yet")
	else:
		print("plant is already growing here")

func _on_oniongrowtimer_timeout():
	var onion_plant = $plant
	if onion_plant.frame == 0:
		onion_plant.frame = 1
		$oniongrowtimer.start()
	elif onion_plant.frame == 1:
		onion_plant.frame = 2
		plant_grown = true

func _on_carrotgrowtimer_timeout():
	var carrot_plant = $plant
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$carrotgrowtimer.start()
	elif carrot_plant.frame == 1:
		carrot_plant.frame = 2
		plant_grown = true
#
#
func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if plant_grown:
			if plant == 1:
				Global.numOfCarrots += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 2:
				Global.numOfOnions += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 0:
				Global.numOfOnions += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
		else:
			print("plant not ready")
