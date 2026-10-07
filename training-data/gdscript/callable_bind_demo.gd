extends Node

func add(a: int, b: int) -> int:
	return a + b

func greet(greeting: String, name: String) -> void:
	print(greeting, ", ", name)

func _ready():
	var c := Callable(self, "add")
	print(c.call(2, 3))

	var add5 := add.bind(5)
	print(add5.call(10))

	var hello := greet.bind("Hello")
	hello.call("Ann")

	var fns: Array[Callable] = [add.bind(1), add.bind(2), func(x): return x * 10]
	for f in fns:
		print(f.call(7))
	print(c.is_valid(), " ", c.get_method())
