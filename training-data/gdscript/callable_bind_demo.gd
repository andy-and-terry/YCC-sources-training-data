extends Node

func greet(greeting: String, name: String) -> String:
	return "%s, %s!" % [greeting, name]

func add(a: int, b: int) -> int:
	return a + b

func _ready():
	var c := Callable(self, "greet")
	print(c.call("Hello", "Ada"))

	var hi := greet.bind("Hi")
	print(hi.call("Bob"))

	var add5 := add.bind(5)
	print(add5.call(10))

	var unbound := add.unbind(1)
	print(unbound.call(1, "ignored"))

	var fns: Array[Callable] = [add.bind(1), add.bind(10), func(x): return x * x]
	for fn in fns:
		print(fn.call(3))

	print(c.is_valid(), " ", c.get_method())
	print(add.callv([2, 3]))

	var timer := get_tree().create_timer(0.1)
	timer.timeout.connect(_on_timeout.bind("bound arg"))

func _on_timeout(msg: String):
	print("timer fired: ", msg)
