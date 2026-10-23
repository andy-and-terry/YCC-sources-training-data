extends Node

func trap(h: Array) -> int:
	var l := 0
	var r := h.size() - 1
	var lmax := 0
	var rmax := 0
	var total := 0
	while l < r:
		if h[l] < h[r]:
			lmax = max(lmax, h[l])
			total += lmax - h[l]
			l += 1
		else:
			rmax = max(rmax, h[r])
			total += rmax - h[r]
			r -= 1
	return total

func _ready():
	print(trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
	print(trap([4, 2, 0, 3, 2, 5]))
