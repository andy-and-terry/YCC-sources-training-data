extends Node

func hex_dump(data: PackedByteArray, width: int = 16) -> void:
	for offset in range(0, data.size(), width):
		var hex := ""
		var text := ""
		for i in range(offset, mini(offset + width, data.size())):
			hex += "%02x " % data[i]
			text += char(data[i]) if data[i] >= 32 and data[i] < 127 else "."
		print("%08x  %s %s" % [offset, hex.rpad(width * 3), text])

func _ready() -> void:
	hex_dump("Hello, GDScript!\nSecond line\t42".to_utf8_buffer())
