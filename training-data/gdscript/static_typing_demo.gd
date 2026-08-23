extends Node

func add_typed(a: int, b: int) -> int:
	return a + b

func concat_typed(a: String, b: String) -> String:
	return a + b

func _ready():
	print(add_typed(3, 4))
	print(concat_typed("Hello, ", "World!"))
