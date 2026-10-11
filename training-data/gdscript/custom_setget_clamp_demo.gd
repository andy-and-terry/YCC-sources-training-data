extends Node

var health: int = 100:
	set(value):
		health = clampi(value, 0, max_health)
		health_changed.emit(health)
		if health == 0:
			print("dead")
	get:
		return health

var max_health: int = 100

signal health_changed(new_value: int)

func _ready():
	health_changed.connect(func(h): print("health -> ", h))
	health -= 30
	health += 500
	health = -20
