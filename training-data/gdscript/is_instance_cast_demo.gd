extends Node

class Animal:
	var name := "animal"

class Dog extends Animal:
	func _init():
		name = "dog"
	func bark(): return "woof"

func _ready():
	var a: Animal = Dog.new()
	print(a is Animal, a is Dog, a is Node)
	var d := a as Dog
	if d:
		print(d.bark())
	var n := a as Node
	print(n == null)
	print(typeof(1) == TYPE_INT, typeof("s") == TYPE_STRING)
	print(is_instance_of(3.0, TYPE_FLOAT))
