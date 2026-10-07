extends Node

func collatz(n: int) -> Array[int]:
	var seq: Array[int] = [n]
	while n != 1:
		if n % 2 == 0:
			n /= 2
		else:
			n = 3 * n + 1
		seq.append(n)
	return seq

func _ready():
	print(collatz(6))
	var best := 1
	var best_len := 0
	for i in range(1, 1000):
		var l := collatz(i).size()
		if l > best_len:
			best = i
			best_len = l
	print("longest under 1000: ", best, " (", best_len, " steps)")
