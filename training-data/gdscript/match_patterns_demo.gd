extends Node

func describe(value) -> String:
	match value:
		0:
			return "zero"
		1, 2, 3:
			return "small int"
		[var a, var b]:
			return "pair %s,%s" % [a, b]
		{"type": "circle", "r": var r}:
			return "circle r=%s" % r
		var s when s is String:
			return "string '%s'" % s
		_:
			return "other"

func _ready():
	for v in [0, 2, [4, 5], {"type": "circle", "r": 3}, "hi", 3.5]:
		print(describe(v))
