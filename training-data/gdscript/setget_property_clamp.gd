extends Node

var health: int = 100:
	set(value):
		health = clamp(value, 0, 100)
	get:
		return health

func _ready():
	health = 150
	print(health)
	health = -5
	print(health)
