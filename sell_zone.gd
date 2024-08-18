extends StaticBody2D

func _on_area_2d_body_entered(body):
	if body.has_method("player_sell_method"):
		print("on")
		var carrots = Global.numOfCarrots
		var onions = Global.numOfOnions
		var coins = Global.numOfCoins
		
		coins += carrots*5 + onions *8
		
		carrots = 0
		onions = 0
		
		Global.numOfCoins = coins
		Global.numOfCarrots = 0
		Global.numOfOnions = 0
