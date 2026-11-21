extends SceneTree

# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
func is_keith(n: int) -> bool:
	var seq: Array[int] = []
	for c in str(n):
		seq.append(int(c))
	var k := seq.size()
	while seq[-1] < n:
		var total := 0
		for i in range(seq.size() - k, seq.size()):
			total += seq[i]
		seq.append(total)
	return seq[-1] == n

func _init() -> void:
	var out: PackedStringArray = []
	for n in range(10, 1200):
		if is_keith(n):
			out.append(str(n))
	print(" ".join(out))
	quit()
