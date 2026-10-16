extends Node

func dedupe_sorted(a: Array) -> int:
	if a.is_empty():
		return 0
	var w = 1
	for i in range(1, a.size()):
		if a[i] != a[w - 1]:
			a[w] = a[i]
			w += 1
	a.resize(w)
	return w

func dedupe_any(a: Array) -> Array:
	var seen = {}
	var out = []
	for v in a:
		if not seen.has(v):
			seen[v] = true
			out.append(v)
	return out

func _ready():
	var a = [1, 1, 2, 2, 2, 3, 5, 5]
	print(dedupe_sorted(a), a)
	print(dedupe_any([3, 1, 3, 2, 1]))
