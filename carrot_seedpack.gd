extends StaticBody2D

var selected = false
var seed_type = 1 #carrot

func _ready():
	$AnimatedSprite.play("default")

func _on_Area2d_input_event(viewport,event,shape_idx):
	if Input.is_action_just_pressed("click"):
		pass
