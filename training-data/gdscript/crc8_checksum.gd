extends Node

func crc8(data: PackedByteArray) -> int:
	var crc := 0
	for b in data:
		crc ^= b
		for i in 8:
			crc = ((crc << 1) ^ 0x07) & 0xFF if crc & 0x80 else (crc << 1) & 0xFF
	return crc

func _ready() -> void:
	print("%02x" % crc8("123456789".to_ascii_buffer()))
