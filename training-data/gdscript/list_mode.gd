extends Node

func modes(items: Array) -> Array:
	var counts := {}
	var top := 0
	for x in items:
		counts[x] = counts.get(x, 0) + 1
		top = max(top, counts[x])
	var out := []
	for k in counts:
		if counts[k] == top:
			out.append(k)
	out.sort()
	return out

func _ready() -> void:
	print(modes([1, 2, 2, 3, 3, 4]))
