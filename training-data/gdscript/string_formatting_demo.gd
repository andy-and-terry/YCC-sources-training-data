extends Node

func _ready():
	var name := "Ada"
	var score := 1234.5678
	print("Hello, %s!" % name)
	print("Score: %d" % score)
	print("Score: %.2f" % score)
	print("%s scored %d points" % [name, 90])
	print("%05d|%-5d|%5d" % [42, 42, 42])
	print("%x %X %o" % [255, 255, 8])
	print("%10s|%-10s|" % ["right", "left"])
	print("%+d %+d" % [5, -5])
	print("{0} then {1}".format([1, 2]))
	print("{who} likes {what}".format({"who": "Bob", "what": "tea"}))
	print("pi=" + str(PI).substr(0, 6))
	print(String.num(3.14159, 3))
	print("abc".lpad(6, "*"), "abc".rpad(6, "-"))
	print("%s" % [[1, 2, 3]])
	print("100%% done" % [])
