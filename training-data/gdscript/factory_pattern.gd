extends Node

class Shape:
	func area() -> float:
		return 0.0

class ShapeCircle extends Shape:
	var radius: float

	func _init(r: float):
		radius = r

	func area() -> float:
		return PI * radius * radius

class ShapeSquare extends Shape:
	var side: float

	func _init(s: float):
		side = s

	func area() -> float:
		return side * side

func shape_factory(kind: String, param: float) -> Shape:
	match kind:
		"circle":
			return ShapeCircle.new(param)
		"square":
			return ShapeSquare.new(param)
		_:
			push_error("unknown shape: " + kind)
			return null

func _ready():
	print(shape_factory("circle", 2.0).area())
	print(shape_factory("square", 3.0).area())
