extends Node

class Counter:
	static var instances := 0
	var value := 0

	func _init():
		instances += 1

	func increment() -> int:
		value += 1
		return value

	static func describe() -> String:
		return "%d counters created" % instances

class Pair:
	var left
	var right

	func _init(l, r):
		left = l
		right = r

	func swapped() -> Pair:
		return Pair.new(right, left)

	func _to_string() -> String:
		return "(%s, %s)" % [left, right]

func _ready():
	var a := Counter.new()
	var b := Counter.new()
	a.increment()
	a.increment()
	b.increment()
	print(a.value, " ", b.value)
	print(Counter.describe())

	var p := Pair.new("x", 1)
	print(p, " -> ", p.swapped())
