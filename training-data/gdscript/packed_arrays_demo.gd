extends Node

func _ready():
	var bytes := PackedByteArray([72, 101, 108, 108, 111])
	print(bytes.get_string_from_utf8())
	bytes.append(33)
	print(bytes.size(), " ", bytes.hex_encode())

	var ints := PackedInt32Array([5, 3, 9, 1])
	ints.sort()
	print(ints)
	ints.push_back(7)
	print(ints.find(9), " ", ints.size())

	var floats := PackedFloat32Array()
	floats.resize(4)
	floats.fill(1.5)
	floats[2] = 4.0
	print(floats)

	var names := PackedStringArray(["delta", "alpha", "charlie"])
	names.sort()
	print(names, " ", "alpha" in names)

	var points := PackedVector2Array([Vector2(0, 0), Vector2(3, 4)])
	print(points[0].distance_to(points[1]))
