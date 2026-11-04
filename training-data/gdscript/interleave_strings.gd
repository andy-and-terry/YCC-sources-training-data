extends Node

func interleave(parts: Array) -> String:
	var longest := 0
	for p in parts:
		longest = maxi(longest, p.length())
	var out := ""
	for i in longest:
		for p in parts:
			if i < p.length():
				out += p[i]
	return out

func _ready() -> void:
	print(interleave(["abc", "12345"]))
	print(interleave(["ab", "cd", "efg"]))
