extends Node

# Kolakoski: a sequence of 1s and 2s that describes its own run lengths
func kolakoski(count: int) -> Array:
	var seq := [1, 2, 2]
	var i := 2  # index of the term giving the next run length
	while seq.size() < count:
		var symbol := 1 if i % 2 == 0 else 2
		for j in range(seq[i]):
			seq.append(symbol)
		i += 1
	return seq.slice(0, count)

func _ready():
	print(kolakoski(20))
