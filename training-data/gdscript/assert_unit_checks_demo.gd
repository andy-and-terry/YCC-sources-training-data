extends Node

var passed := 0
var failed := 0

func check(name: String, cond: bool):
	if cond:
		passed += 1
	else:
		failed += 1
		print("FAIL: ", name)

func _ready():
	check("add", 1 + 1 == 2)
	check("string", "a" + "b" == "ab")
	check("float approx", is_equal_approx(0.1 + 0.2, 0.3))
	check("array eq", [1, 2] == [1, 2])
	check("dict eq", {"a": 1} == {"a": 1})
	check("deliberate", 2 > 3)
	print("passed=%d failed=%d" % [passed, failed])
	assert(passed == 5, "unexpected pass count")
