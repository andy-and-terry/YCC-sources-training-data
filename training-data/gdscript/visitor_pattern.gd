extends Node

class Circle:
	var radius: float

	func _init(r: float):
		radius = r

	func accept(visitor):
		return visitor.visit_circle(self)

class Square:
	var side: float

	func _init(s: float):
		side = s

	func accept(visitor):
		return visitor.visit_square(self)

class AreaVisitor:
	func visit_circle(c: Circle) -> float:
		return PI * c.radius * c.radius

	func visit_square(s: Square) -> float:
		return s.side * s.side

class DescribeVisitor:
	func visit_circle(c: Circle) -> String:
		return "circle with radius %s" % c.radius

	func visit_square(s: Square) -> String:
		return "square with side %s" % s.side

func _ready():
	var shapes = [Circle.new(2.0), Square.new(3.0)]
	var area_visitor = AreaVisitor.new()
	var describe_visitor = DescribeVisitor.new()
	for shape in shapes:
		print(shape.accept(describe_visitor), " -> area: ", shape.accept(area_visitor))
