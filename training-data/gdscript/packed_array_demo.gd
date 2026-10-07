extends Node

func _ready():
	var ints := PackedInt32Array([5, 3, 8])
	ints.append(1)
	ints.sort()
	print(ints, " size=", ints.size())

	var strs := PackedStringArray(["b", "a"])
	strs.push_back("c")
	print(",".join(strs))

	var floats := PackedFloat32Array()
	floats.resize(3)
	floats.fill(1.5)
	print(floats)

	var bytes := "Hi".to_utf8_buffer()
	print(bytes, " ", bytes.get_string_from_utf8())
	print(ints.find(8), " ", ints.has(3))
