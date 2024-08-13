extends StaticBody2D

var selected = false
var seed_type = 1 #carrot

func _ready(): #void start()
	$AnimatedSprite2D.play("default")

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position,get_global_mouse_position(),25 * delta)

func _on_Area_2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		Global.plantselected = seed_type
		selected=true
		print("wawa")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print(str(event) + " Evento")
		print(str(event.pressed) + " Evento pressed")
		print(str(MOUSE_BUTTON_LEFT))
		if (event.button_index == MOUSE_BUTTON_LEFT) and not event.pressed:
			selected = false
