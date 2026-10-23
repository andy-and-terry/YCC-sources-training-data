extends Node

# Marshalls converts between Base64 text and raw bytes or strings.

func _ready():
	var text := "Hello, Godot!"
	var encoded := Marshalls.utf8_to_base64(text)
	print(encoded)
	print(Marshalls.base64_to_utf8(encoded))

	var bytes := PackedByteArray([0, 1, 2, 250, 251, 255])
	var b64 := Marshalls.raw_to_base64(bytes)
	print(b64)
	var back := Marshalls.base64_to_raw(b64)
	print(back)
	print(back == bytes)

	# Any Variant can be serialized to Base64 and restored.
	var data := {"name": "hero", "hp": 100, "pos": Vector2(1, 2)}
	var packed := Marshalls.variant_to_base64(data)
	var restored = Marshalls.base64_to_variant(packed)
	print(restored)
	print(restored["pos"].x)

	# Padding length depends on input length modulo 3.
	for s in ["a", "ab", "abc"]:
		print(s, " -> ", Marshalls.utf8_to_base64(s))
