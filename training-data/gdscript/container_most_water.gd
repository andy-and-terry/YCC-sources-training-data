func max_area(h: Array) -> int:
	var lo := 0
	var hi := h.size() - 1
	var best := 0
	while lo < hi:
		best = max(best, min(h[lo], h[hi]) * (hi - lo))
		if h[lo] < h[hi]:
			lo += 1
		else:
			hi -= 1
	return best

func _ready() -> void:
	print(max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]))  # 49
