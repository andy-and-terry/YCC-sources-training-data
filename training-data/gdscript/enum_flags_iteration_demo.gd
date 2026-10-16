extends Node

enum Color { RED, GREEN = 5, BLUE }
enum Dir { UP = 1, DOWN = 2, LEFT = 4, RIGHT = 8 }

func _ready():
	print(Color.RED, Color.GREEN, Color.BLUE)
	print(Color.keys(), Color.values())
	for name in Color:
		print(name, "=", Color[name])
	print(Color.find_key(6))
	var mask = Dir.UP | Dir.RIGHT
	print(mask, mask & Dir.UP != 0, mask & Dir.DOWN != 0)
	mask &= ~Dir.UP
	print(mask)
	mask ^= Dir.LEFT
	print(mask)
