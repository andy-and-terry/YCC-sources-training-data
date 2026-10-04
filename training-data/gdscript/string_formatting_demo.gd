extends Node

func _ready():
	print("%s is %d years old" % ["Ann", 30])
	print("%05.1f|%-6s|%6s|" % [3.14159, "ab", "cd"])
	print("%x %o %b" % [255, 8, 5])
	print("{0} + {1}".format([1, 2]))
	print("{name} scored {score}".format({"name": "Bob", "score": 9}))
	print("hello".to_upper(), " ", "Hello".capitalize(), " ", "a-b-c".split("-"))
	print("abc".repeat(2), " ", "x".lpad(4, "."), " ", "7".pad_zeros(3))
	print("  trim me ".strip_edges(), "|", "hello world".find("world"))
	print("file.tar.gz".get_extension(), " ", "path/to/file.txt".get_file())
