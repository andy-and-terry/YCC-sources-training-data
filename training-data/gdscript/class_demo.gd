class_name Shape
extends RefCounted

func area() -> float:
	return 0.0

class Circle extends Shape:
	var radius: float

	func _init(r: float):
		radius = r

	func area() -> float:
		return PI * radius * radius

class Rectangle extends Shape:
	var width: float
	var height: float

	func _init(w: float, h: float):
		width = w
		height = h

	func area() -> float:
		return width * height
