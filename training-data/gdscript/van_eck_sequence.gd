extends Node

# Van Eck: next term is the distance since the last term previously appeared, else 0
func van_eck(count: int) -> Array:
	var seq := [0]
	for n in range(1, count):
		var nxt := 0
		for k in range(n - 2, -1, -1):
			if seq[k] == seq[n - 1]:
				nxt = n - 1 - k
				break
		seq.append(nxt)
	return seq

func _ready():
	print(van_eck(20))
