extends Node

func jaccard(a: Array, b: Array) -> float:
	var union := {}
	var inter := 0
	for x in a:
		union[x] = true
	for x in b:
		if union.has(x) and a.has(x):
			inter += 1
		union[x] = true
	return 1.0 if union.is_empty() else float(inter) / union.size()

func _ready() -> void:
	print(jaccard([1, 2, 3, 4], [3, 4, 5]))
