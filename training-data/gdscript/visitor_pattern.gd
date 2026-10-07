extends Node

class Circle:
	var radius: float

	func _init(r: float) -> void:
		radius = r

	func accept(visitor) -> void:
		visitor.visit_circle(self)

class Square:
	var side: float

	func _init(s: float) -> void:
		side = s

	func accept(visitor) -> void:
		visitor.visit_square(self)

class AreaVisitor:
	func visit_circle(c: Circle) -> void:
		print("circle area: %.2f" % (PI * c.radius * c.radius))

	func visit_square(s: Square) -> void:
		print("square area: %.2f" % (s.side * s.side))

func _ready():
	var shapes := [Circle.new(2.0), Square.new(3.0)]
	var visitor := AreaVisitor.new()
	for shape in shapes:
		shape.accept(visitor)
