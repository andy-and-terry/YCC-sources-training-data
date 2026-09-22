extends Node

class Shape:
	func area() -> float:
		push_error("area() must be overridden by a subclass")
		return 0.0

	func describe() -> String:
		return "shape with area %.2f" % area()

class Square extends Shape:
	var side: float

	func _init(s: float):
		side = s

	func area() -> float:
		return side * side

class Circle extends Shape:
	var radius: float

	func _init(r: float):
		radius = r

	func area() -> float:
		return PI * radius * radius

func _ready():
	var shapes = [Square.new(3.0), Circle.new(2.0)]
	for shape in shapes:
		print(shape.describe())
