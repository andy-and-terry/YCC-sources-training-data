extends Node

# Ulam numbers: after 1 and 2, the smallest number that is a sum of two
# distinct earlier terms in exactly one way
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
	print(ulam(15))
