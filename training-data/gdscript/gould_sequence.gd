extends SceneTree

func popcount(n: int) -> int:
	var c := 0
	while n > 0:
		c += n & 1
		n >>= 1
	return c

func _init() -> void:
	var out := []
	for n in 16: out.append(1 << popcount(n))
	print(out)
	quit()
