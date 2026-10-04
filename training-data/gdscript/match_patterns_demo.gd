extends Node

func describe(value) -> String:
	match value:
		null:
			return "nothing"
		0:
			return "zero"
		1, 2, 3:
			return "small number"
		var n when n is int and n < 0:
			return "negative"
		"hello":
			return "greeting"
		[]:
			return "empty array"
		[1, var second]:
			return "array starting with 1, then %s" % second
		[var first, ..]:
			return "array starting with %s" % first
		{"type": "circle", "radius": var r}:
			return "circle r=%s" % r
		{"type": var t}:
			return "shape of type " + t
		_:
			return "something else"

func _ready():
	var tests = [null, 0, 2, -9, "hello", [], [1, "x"], [7, 8, 9],
		{"type": "circle", "radius": 4}, {"type": "square"}, 3.5]
	for t in tests:
		print(describe(t))
