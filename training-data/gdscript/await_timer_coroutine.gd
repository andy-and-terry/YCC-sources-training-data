extends Node

func _ready():
	print("start")
	await get_tree().create_timer(0.1).timeout
	print("after delay")
