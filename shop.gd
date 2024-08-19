extends StaticBody2D

func _ready():
	$shopmenu.visible = false
	$berry_seedpack.visible = false

func _process(delta: float) -> void:
	if $shopmenu.item1owned == true:
		$berry_seedpack.visible = true
	else:
		$berry_seedpack.visible = false
		
func _on_area_2d_body_entered(body):
	if body.has_method("player_shop_method"):
		print("entering")
		$shopmenu.visible = true

func _on_area_2d_body_exited(body):
	if body.has_method("player_shop_method"):
		print("exiting")
		$shopmenu.visible = false
