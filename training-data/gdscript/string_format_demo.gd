extends Node

func _ready():
	print("%d items" % 3)
	print("%s is %d years" % ["Ann", 30])
	print("%.2f|%5d|%-5d|%05d" % [3.14159, 42, 42, 42])
	print("%x %o %c" % [255, 8, 65])
	print("{name} has {n}".format({"name": "Bob", "n": 4}))
	print("abc".to_upper(), " ", "a,b,c".split(","), " ", "  pad ".strip_edges())
	print("hello".substr(1, 3), " ", "hello".find("ll"), " ", "x".repeat(3))
	print("42".is_valid_int(), " ", "3.5".to_float(), " ", String.num(2.0 / 3.0, 3))
	print("hello world".capitalize(), " ", "Hello".begins_with("He"))
