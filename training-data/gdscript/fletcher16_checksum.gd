extends SceneTree

func fletcher16(data: PackedByteArray) -> int:
	var s1 := 0
	var s2 := 0
	for b in data:
		s1 = (s1 + b) % 255
		s2 = (s2 + s1) % 255
	return (s2 << 8) | s1

func _init() -> void:
	print("%x" % fletcher16("abcde".to_utf8_buffer()))
	quit()
