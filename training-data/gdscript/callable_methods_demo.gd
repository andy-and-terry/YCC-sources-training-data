extends Node

func double(x): return x * 2
func add(a, b): return a + b

func _ready():
	var c = Callable(self, "double")
	print(c.call(4))
	var c2 = double
	print(c2.callv([5]))
	var add5 = add.bind(5)
	print(add5.call(10))
	var unb = add.unbind(1)
	print(unb.call(1, "ignored"))
	print(c.is_valid(), c.get_method(), c.get_object() == self)
	print([1, 2, 3].map(double))
	print([3, 1, 2].filter(func(x): return x > 1))
