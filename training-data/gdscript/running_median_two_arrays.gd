extends Node

func median_sorted(a: Array) -> float:
	var n = a.size()
	if n == 0:
		return 0.0
	if n % 2 == 1:
		return float(a[n / 2])
	return (a[n / 2 - 1] + a[n / 2]) / 2.0

func running_medians(stream: Array) -> Array:
	var seen = []
	var out = []
	for v in stream:
		seen.append(v)
		seen.sort()
		out.append(median_sorted(seen))
	return out

func _ready():
	print(running_medians([5, 15, 1, 3]))
