extends Node

func _ready() -> void:
	print("start")
	await get_tree().create_timer(1.0).timeout
	print("one second later")
