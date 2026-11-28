extends SceneTree

func secant(f: Callable, x0: float, x1: float) -> float:
	for i in 50:
		var f0: float = f.call(x0)
		var f1: float = f.call(x1)
		if f1 == f0: break
		var nxt := x1 - f1 * (x1 - x0) / (f1 - f0)
		x0 = x1
		x1 = nxt
		if absf(x1 - x0) < 1e-12: break
	return x1

func _init() -> void:
	print(secant(func(x): return x * x - 2.0, 1.0, 2.0))
	quit()
