extends Node

func is_armstrong(n: int) -> bool:
	var s := str(n)
	var total := 0
	for c in s:
		total += int(pow(int(c), s.length()))
	return total == n

func _ready() -> void:
	var result := []
	for n in range(1, 1000):
		if is_armstrong(n):
			result.append(n)
	print(result)  # [1..9, 153, 370, 371, 407]
