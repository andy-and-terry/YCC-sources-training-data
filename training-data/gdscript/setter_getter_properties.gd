extends Node

var health: int = 100:
	set(value):
		health = clampi(value, 0, max_health)
		print("health -> ", health)
	get:
		return health

var max_health: int = 100

var is_alive: bool:
	get:
		return health > 0

func _ready():
	health -= 30
	health += 500
	health = -5
	print(is_alive)
