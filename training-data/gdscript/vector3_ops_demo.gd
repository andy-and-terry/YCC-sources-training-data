extends Node

func _ready():
	var a = Vector3(1, 2, 3)
	var b = Vector3(4, 5, 6)
	print(a + b, a * 2, a.dot(b))
	print(a.cross(b))
	print(a.length(), Vector3(3, 4, 0).length())
	print(Vector3(0, 3, 4).normalized())
	print(a.distance_to(b))
	print(a.lerp(b, 0.5))
	print(Vector3.UP, Vector3.ZERO, Vector3.ONE)
	print(a.abs(), a.sign())
	print(Vector3(1, 0, 0).angle_to(Vector3(0, 1, 0)))
