extends Node

func describe(v) -> String:
	match v:
		[]:
			return "empty array"
		[var only]:
			return "one element: %s" % str(only)
		[var first, ..]:
			return "starts with %s" % str(first)
		{"type": "circle", "r": var r}:
			return "circle r=%s" % str(r)
		{"type": var t}:
			return "shape " + t
		_:
			return "other"

func _ready():
	print(describe([]))
	print(describe([7]))
	print(describe([1, 2, 3]))
	print(describe({"type": "circle", "r": 4}))
	print(describe({"type": "square"}))
	print(describe(3.5))
