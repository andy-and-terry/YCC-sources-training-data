extends Node

var health: int = 100:
	set(value):
		health = clampi(value, 0, max_health)
		print("health is now ", health)
	get:
		return health

var max_health: int = 100

var is_alive: bool:
	get:
		return health > 0

var _name := "player"
var display_name: String:
	get:
		return _name.capitalize()
	set(value):
		_name = value.strip_edges().to_lower()

func _ready():
	health = 150
	health -= 130
	print(is_alive)
	health = -5
	print(is_alive)
	display_name = "  GODOT hero "
	print(display_name)
