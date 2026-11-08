extends Node

func varint(n: int) -> PackedByteArray:
	var out := PackedByteArray()
	while n >= 128:
		out.append((n & 0x7F) | 0x80)
		n >>= 7
	out.append(n)
	return out

func _ready() -> void:
	print(varint(300).hex_encode())
