extends Node

enum State { IDLE, WALKING, JUMPING, FALLING }
enum Direction { LEFT = -1, NONE = 0, RIGHT = 1 }

var state: State = State.IDLE

func describe(s: State) -> String:
	match s:
		State.IDLE:
			return "standing"
		State.WALKING, State.JUMPING:
			return "moving"
		_:
			return "falling"

func classify(value) -> String:
	match value:
		0:
			return "zero"
		[1, var second]:
			return "pair starting with 1, second=%s" % second
		{"type": "box", "size": var s}:
			return "box of size %s" % s
		var n when n is int and n > 100:
			return "big int"
		var s when s is String:
			return "string " + s
	return "other"

func _ready() -> void:
	for s in State.values():
		print(State.keys()[s], " -> ", describe(s))
	print(classify(0), "|", classify([1, 5]), "|", classify({"type": "box", "size": 3}), "|", classify(500), "|", classify("hi"))
	print(Direction.RIGHT * 10, " ", Direction.find_key(-1))
