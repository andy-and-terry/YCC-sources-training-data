extends Node

func _ready():
	var bytes := PackedByteArray([72, 101, 108, 108, 111])
	print(bytes.get_string_from_utf8())
	bytes.append(33)
	print(bytes.size(), bytes[5])

	var ints := PackedInt32Array([5, 3, 9])
	ints.append(1)
	ints.sort()
	print(ints)
	print(ints.has(9), ints.find(3))

	var floats := PackedFloat32Array()
	floats.resize(3)
	floats.fill(1.5)
	floats[1] = 2.5
	print(floats)

	var names := PackedStringArray(["b", "a"])
	names.append("c")
	names.sort()
	print(",".join(names))
	print("x y z".split(" "))

	var points := PackedVector2Array([Vector2(0, 0), Vector2(1, 1)])
	points.push_back(Vector2(2, 4))
	print(points.size(), points[2])

	var from_array := PackedInt32Array([1, 2, 3, 4])
	print(from_array.slice(1, 3), Array(from_array))
	print("hé".to_utf8_buffer().size())
