extends Node

class Point:
	var x: float
	var y: float

	func _init(px: float = 0.0, py: float = 0.0):
		x = px
		y = py

	func distance_to(other: Point) -> float:
		return sqrt(pow(x - other.x, 2) + pow(y - other.y, 2))

	func _to_string() -> String:
		return "(%s, %s)" % [x, y]

class Point3D extends Point:
	var z: float = 0.0

	func _to_string() -> String:
		return "(%s, %s, %s)" % [x, y, z]

func _ready():
	var a = Point.new(0, 0)
	var b = Point.new(3, 4)
	print(a, " ", b, " ", a.distance_to(b))
	print(Point3D.new(1, 2))
