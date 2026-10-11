extends Node

func _ready():
	var a = Rect2(0, 0, 10, 10)
	var b = Rect2(5, 5, 10, 10)
	var c = Rect2(20, 20, 5, 5)
	print(a.intersects(b), a.intersects(c))
	print(a.intersection(b))
	print(a.merge(c))
	print(a.has_point(Vector2(3, 3)), a.has_point(Vector2(11, 3)))
	print(a.get_center(), a.get_area())
	print(a.grow(2))
	print(a.encloses(Rect2(1, 1, 2, 2)))
	print(a.position, a.size, a.end)
