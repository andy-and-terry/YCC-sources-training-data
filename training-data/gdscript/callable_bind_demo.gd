extends Node

func greet(greeting: String, name: String) -> String:
	return "%s, %s!" % [greeting, name]

func add(a: int, b: int, c: int) -> int:
	return a + b + c

func _ready():
	var c := Callable(self, "greet")
	print(c.call("Hello", "Ada"))

	var hello := greet.bind("Hi")
	print(hello.call("Bob"))

	var add_ten := add.bind(5, 5)
	print(add_ten.call(1))

	var mapped := [1, 2, 3].map(add.bind(10, 20))
	print(mapped)

	var unbound := add.unbind(1)
	print(unbound.call(1, 2, 3, 4))

	print(c.is_valid(), c.get_method(), c.get_object() == self)
	print(c.get_argument_count())

	var items := [3, 1, 2]
	items.sort_custom(func(a, b): return a > b)
	print(items)

	var ops := {"double": func(x): return x * 2, "square": func(x): return x * x}
	for key in ops:
		print(key, " ", ops[key].call(7))
