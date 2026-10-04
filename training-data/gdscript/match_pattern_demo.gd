extends Node

func classify(value) -> String:
	match value:
		0:
			return "zero"
		1, 2, 3:
			return "small"
		[]:
			return "empty array"
		[var first, ..]:
			return "array starting with %s" % first
		{"type": "circle", "radius": var r}:
			return "circle r=%s" % r
		{"type": var t}:
			return "shape of type %s" % t
		"hello":
			return "greeting"
		var n when n is int and n < 0:
			return "negative"
		var other:
			return "other: %s" % str(other)

func _ready():
	var samples = [0, 2, [], [7, 8], {"type": "circle", "radius": 5}, {"type": "square"}, "hello", -4, 99, 2.5]
	for s in samples:
		print(classify(s))
