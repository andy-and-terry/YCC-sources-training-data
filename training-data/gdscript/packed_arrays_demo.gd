extends Node

func _ready():
	var bytes := PackedByteArray([72, 101, 108, 108, 111])
	print(bytes.get_string_from_utf8())
	bytes.append(33)
	print(bytes.size(), " ", bytes.hex_encode())

	var ints := PackedInt32Array([5, 3, 9, 1])
	ints.sort()
	print(ints)
	print(ints.has(9), " ", ints.find(3))

	var floats := PackedFloat32Array()
	floats.resize(3)
	floats.fill(1.5)
	print(floats)

	var names := PackedStringArray(["b", "a", "c"])
	names.sort()
	print(",".join(names))

	var points := PackedVector2Array([Vector2(0, 0), Vector2(1, 1)])
	points.append(Vector2(2, 0))
	print(points.size(), " ", points[2])
