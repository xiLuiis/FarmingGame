extends StaticBody2D


func _physics_process(delta):
	if plantgrowing == false:
		plant = Global.plantSelected
