func insert_interval(iv: Array, new_iv: Array) -> Array:
	var out := []
	var lo: int = new_iv[0]
	var hi: int = new_iv[1]
	var i := 0
	while i < iv.size() and iv[i][1] < lo:
		out.append(iv[i])
		i += 1
	while i < iv.size() and iv[i][0] <= hi:
		lo = min(lo, iv[i][0])
		hi = max(hi, iv[i][1])
		i += 1
	out.append([lo, hi])
	while i < iv.size():
		out.append(iv[i])
		i += 1
	return out

func _ready() -> void:
	print(insert_interval([[1, 3], [6, 9]], [2, 5]))  # [[1, 5], [6, 9]]
