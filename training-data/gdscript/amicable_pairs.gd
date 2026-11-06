# Amicable pairs: d(a) == b and d(b) == a with a != b.
extends Node

func d(n: int) -> int:
	var s := 0
	for i in range(1, n):
		if n % i == 0:
			s += i
	return s

func _ready() -> void:
	for a in range(2, 1500):
		var b := d(a)
		if b > a and d(b) == a:
			print(a, " ", b)
