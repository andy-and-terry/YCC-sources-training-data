extends Node

func describe(value) -> String:
	match value:
		0:
			return "zero"
		1, 2, 3:
			return "small"
		var n when n is int and n < 0:
			return "negative"
		"hello":
			return "greeting"
		[1, 2]:
			return "exact pair"
		[var first, ..]:
			return "array starting with %s" % first
		{"name": var name, "age": var age}:
			return "%s is %d" % [name, age]
		Vector2(0, 0):
			return "origin"
		_:
			return "other"

func _ready():
	for v in [0, 2, -5, "hello", [1, 2], [9, 8, 7], {"name": "Ada", "age": 36}, Vector2(0, 0), 99]:
		print(describe(v))
