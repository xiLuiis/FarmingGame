extends Node2D

func _physics_process(delta):
	$carrottext.text = ("=" + str(Global.numOfCarrots))
	$oniontext.text = ("=" + str(Global.numOfOnions))
