extends SceneTree

# Ways to write n as a sum of two or more consecutive positive integers.
func polite_ways(n: int) -> int:
	var ways := 0
	var k := 2
	while k * (k + 1) / 2 <= n:
		if (n - k * (k - 1) / 2) % k == 0:
			ways += 1
		k += 1
	return ways

func _init() -> void:
	var out := []
	for n in range(1, 17):
		out.append(str(polite_ways(n)))
	print(" ".join(out))
	quit()
