extends StaticBody2D

func _on_area_2d_body_entered(body):
	if body.has_method("player_shop_method"):
		print("entering")

func _on_area_2d_body_exited(body):
	if body.has_method("player_shop_method"):
		print("exiting")
