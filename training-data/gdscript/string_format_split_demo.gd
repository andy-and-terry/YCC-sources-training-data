extends Node

func _ready():
	var s := "alpha,beta,,gamma"
	print(s.split(","))
	print(s.split(",", false))
	print("%s has %d items (%.2f%%)" % ["list", 3, 42.5])
	print("{0} and {1}".format(["a", "b"]))
	print("hello".to_upper(), " ", "Hello".capitalize(), " ", "abc".repeat(2))
	print("  trim me ".strip_edges())
	print("hello world".replace("world", "godot").begins_with("hello"))
	print("42".is_valid_int(), " ", "4x".is_valid_int())
