extends Node

# Golomb: G(1) = 1, G(n) = 1 + G(n - G(G(n-1)))
func golomb(count: int) -> Array:
	var g := [0, 1]  # index 0 unused
	for n in range(2, count + 1):
		g.append(1 + g[n - g[g[n - 1]]])
	g.remove_at(0)
	return g

func _ready():
	print(golomb(20))
