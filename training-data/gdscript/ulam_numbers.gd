extends Node

# Next term: smallest value with exactly one representation as a sum of two distinct terms
func ulam(count: int) -> Array:
	var terms := [1, 2]
	var cand := 2
	while terms.size() < count:
		cand += 1
		var ways := 0
		for a in range(terms.size()):
			for b in range(a + 1, terms.size()):
				if terms[a] + terms[b] == cand:
					ways += 1
		if ways == 1:
			terms.append(cand)
	return terms

func _ready():
	print(" ".join(ulam(15).map(func(x): return str(x))))
