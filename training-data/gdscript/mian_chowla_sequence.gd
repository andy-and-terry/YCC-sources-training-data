extends SceneTree

# Greedy sequence whose pairwise sums are all distinct.
func _init() -> void:
	var seq := []
	var sums := {}
	var cand := 1
	while seq.size() < 8:
		var fresh := {}
		var ok := true
		for x in seq + [cand]:
			var s: int = x + cand
			if sums.has(s) or fresh.has(s):
				ok = false
				break
			fresh[s] = true
		if ok:
			seq.append(cand)
			for s in fresh:
				sums[s] = true
		cand += 1
	print(" ".join(seq.map(func(v): return str(v))))
	quit()
