extends Node

func _ready():
	var name = "Ada"
	var score = 42.5
	print("Hello, %s! Score: %.1f" % [name, score])
	print("%05d | %-6s | %6s" % [42, "left", "right"])
	print("%x %X %o %c" % [255, 255, 8, 65])
	print("Hex %08X, percent %d%%" % [48879, 50])

	var template = "{who} has {count} items"
	print(template.format({"who": "Bob", "count": 3}))

	print("abc".to_upper(), " ", "ABC".to_lower(), " ", "hello world".capitalize())
	print("a,b,,c".split(",", false))
	print(", ".join(PackedStringArray(["x", "y", "z"])))
	print("  padded  ".strip_edges() + "|")
	print("7".pad_zeros(3), " ", "godot".substr(1, 3), " ", "godot".find("d"))
	print("hello".begins_with("he"), " ", "hello".ends_with("lo"), " ", "ab".repeat(3))
