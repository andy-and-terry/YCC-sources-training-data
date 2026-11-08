extends Node

func f(x: float) -> float:
	return x * x - 2.0

func secant(a: float, b: float) -> float:
	for i in 40:
		if is_equal_approx(f(a), f(b)):
			break
		var c := b - f(b) * (b - a) / (f(b) - f(a))
		a = b
		b = c
	return b

func _ready() -> void:
	print("%.8f" % secant(1.0, 2.0))
