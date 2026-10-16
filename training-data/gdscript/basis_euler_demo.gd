extends Node

func _ready():
	var b = Basis.from_euler(Vector3(0, PI / 2, 0))
	print(b * Vector3(1, 0, 0))
	var q = Quaternion(Vector3.UP, PI / 2)
	print(q * Vector3(0, 0, -1))
	print(q.get_euler())
	var t = Transform3D(b, Vector3(1, 2, 3))
	print(t.origin, t * Vector3.ZERO)
	print(Quaternion.IDENTITY.slerp(q, 0.5).get_angle())
	print(Basis.IDENTITY.determinant())
