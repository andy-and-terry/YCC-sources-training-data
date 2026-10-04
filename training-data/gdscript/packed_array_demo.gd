extends Node

func _ready():
	var ints := PackedInt32Array([5, 3, 8])
	ints.append(1)
	ints.sort()
	print(ints, " ", ints.size(), " ", ints.has(8))

	var floats := PackedFloat32Array()
	floats.resize(3)
	floats.fill(1.5)
	print(floats)

	var names := PackedStringArray(["b", "a"])
	names.push_back("c")
	print(",".join(names))

	var bytes := "Hi".to_utf8_buffer()
	print(bytes, " ", bytes.get_string_from_utf8())
	print(ints.slice(1, 3))
