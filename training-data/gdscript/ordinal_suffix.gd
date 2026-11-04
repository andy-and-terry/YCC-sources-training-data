extends Node

func ordinal(n: int) -> String:
	var r100 := n % 100
	if r100 >= 11 and r100 <= 13:
		return "%dth" % n
	match n % 10:
		1: return "%dst" % n
		2: return "%dnd" % n
		3: return "%drd" % n
		_: return "%dth" % n

func _ready() -> void:
	var out := []
	for n in [1, 2, 3, 4, 11, 12, 13, 21, 101, 111]:
		out.append(ordinal(n))
	print(" ".join(out))
