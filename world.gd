extends Node2D

func _physics_process(delta):
	$carrottext.text = ("=" + str(Global.numOfCarrots))
	$oniontext.text = ("=" + str(Global.numOfOnions))
	$cointext.text = ("=" + str(Global.numOfCoins))

func _ready():
	Global.numOfCoins = 100
