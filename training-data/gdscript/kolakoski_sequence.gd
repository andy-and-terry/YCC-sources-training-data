extends Node

# Kolakoski over {1, 2}: the run lengths of the sequence describe itself
func kolakoski(count: int) -> Array:
	var terms := [1, 2, 2]
	var idx := 2
	while terms.size() < count:
		var sym: int = 3 - terms[-1]
		for _k in range(terms[idx]):
			terms.append(sym)
		idx += 1
	return terms.slice(0, count)

func _ready():
	print(" ".join(kolakoski(20).map(func(x): return str(x))))
