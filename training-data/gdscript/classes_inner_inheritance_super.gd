extends Node

class Animal:
	var name: String
	func _init(n: String) -> void:
		name = n
	func speak() -> String:
		return "%s makes a sound" % name

class Dog extends Animal:
	var tricks: Array[String] = []
	func _init(n: String) -> void:
		super(n)
	func speak() -> String:
		return super() + " (woof)"
	func learn(t: String) -> Dog:
		tricks.append(t)
		return self

class Counter:
	static var instances := 0
	var value := 0
	func _init() -> void:
		Counter.instances += 1
	func increment() -> int:
		value += 1
		return value

func _ready() -> void:
	var d := Dog.new("Rex").learn("sit").learn("roll")
	print(d.speak(), " ", d.tricks)
	print(d is Animal, " ", d is Dog, " ", d.get_class())
	var c1 := Counter.new()
	var c2 := Counter.new()
	c1.increment()
	print(c1.value, c2.value, Counter.instances)
