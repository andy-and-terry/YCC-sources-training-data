extends Node

func _ready():
	var csv = "apple,banana,,cherry"
	var parts = csv.split(",")
	print(parts)
	print(csv.split(",", false))
	print(", ".join(parts))
	print("a-b-c".rsplit("-", true, 1))
	print("  padded  ".strip_edges())
	print("hello".capitalize(), "Hello".to_upper(), "Hello".to_lower())
	print("abc".begins_with("ab"), "abc".ends_with("bc"))
	print("hello world".replace("o", "0"))
	print("x".repeat(3), "abc".length())
	print("hello".substr(1, 3), "hello".find("l"), "hello".rfind("l"))
