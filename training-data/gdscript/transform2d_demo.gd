extends Node

func _ready():
	var t = Transform2D(PI / 2, Vector2(10, 0))
	var p = Vector2(1, 0)
	print(t * p)
	print(t.get_rotation(), t.origin, t.get_scale())
	var inv = t.affine_inverse()
	print(inv * (t * p))
	var s = Transform2D.IDENTITY.scaled(Vector2(2, 3))
	print(s * Vector2(1, 1))
	print(t.translated(Vector2(5, 5)).origin)
	print(p.rotated(PI), p.orthogonal())
