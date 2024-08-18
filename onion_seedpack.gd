extends StaticBody2D

var selected = false
var seed_type = 2 #onion

func _ready(): #void start()
	$AnimatedSprite2D.play("default")

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position,get_global_mouse_position(),25 * delta)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if (event.button_index == MOUSE_BUTTON_LEFT) and not event.pressed:
			selected = false
			Global.plantSelected = 0

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		Global.plantSelected = seed_type
		selected=true
