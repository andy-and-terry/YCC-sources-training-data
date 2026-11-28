extends Node

func is_happy(start: int) -> bool:
	var seen := {}
	var n := start
	while n != 1 and not seen.has(n):
		seen[n] = true
		var s := 0
		for c in str(n):
			s += int(c) * int(c)
		n = s
	return n == 1

func _ready() -> void:
	var found := []
	var n := 1
	while found.size() < 8:
		if is_happy(n):
			found.append(n)
		n += 1
	print(found)  # [1, 7, 10, 13, 19, 23, 28, 31]
