extends Node

class Animal:
	var name: String

	func _init(n: String):
		name = n

	func speak() -> String:
		return name + " makes a sound"

class Dog extends Animal:
	func speak() -> String:
		return name + " barks"

func _ready():
	var animals = [Animal.new("Generic"), Dog.new("Rex")]
	for a in animals:
		print(a.speak())
