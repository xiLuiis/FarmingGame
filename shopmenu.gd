extends StaticBody2D

#item 1=berry,2=randomseed
var item = 1

var item1price=100
var item2price=250

var item1owned = false
var item2owned = false

var green_color_value = "00ff004c"
var red_color_value = "ff00004c"

var price = 0

func _ready() -> void:
	$icon.play("berryseed")
	item=1
	price = 0
	$shopicon.color = green_color_value

func _physics_process(delta: float) -> void:
	if self.visible == true:
		if item==1:
			$icon.play("berryseed")
			price = item1price
			$pricetext.text = ("[font_size=12]" + str(item1price)+ "[/font_size]")
			if(item1owned):
				$shopicon.color = red_color_value
			else:
				$shopicon.color = green_color_value
			
		if item==2:
			$icon.play("randomseed")
			price = item2price
			$pricetext.text = ("[font_size=12]" + str(item2price)+ "[/font_size]")
			if(item2owned):
				$shopicon.color = red_color_value
			else:
				
				$shopicon.color = green_color_value
			
		

func _on_left_button_pressed() -> void:
	swap_item_back()

func _on_right_button_pressed() -> void:
	swap_item_forward()
	
func _on_buy_button_pressed() -> void:
	if item==1:
		if not item1owned:
			price=item1price
			if Global.numOfCoins >= price:
				Global.numOfCoins-=price
				item1owned=true
			else:
				print("You cant pay this")
		else:
			print("already purchased")
	if item==2:
		if not item2owned:
			price=item2price
			if Global.numOfCoins >= price:
				Global.numOfCoins-=price
				item2owned=true
			else:
				print("You cant pay this")
		else:
			print("already purchased")

func swap_item_back():
	if item==1:
		item=2
	elif item ==2:
		item=1

func swap_item_forward():
	if item==2:
		item=1
	elif item ==1:
		item=2
