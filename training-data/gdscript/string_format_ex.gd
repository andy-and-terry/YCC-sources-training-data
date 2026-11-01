extends Node

func _ready():
	print("%s has %d coins (%.1f%%)" % ["Ann", 42, 12.5])
	print("a,b,c".split(","), "  x ".strip_edges(), "abc".to_upper())
	print("hello".substr(1, 3), "x".repeat(3), "Hello".contains("ell"))
