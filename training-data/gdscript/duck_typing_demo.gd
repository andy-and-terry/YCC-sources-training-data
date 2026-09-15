extends Node

class Dog:
	func speak() -> String:
		return "Woof!"

class Cat:
	func speak() -> String:
		return "Meow!"

func make_it_speak(animal) -> String:
	if animal.has_method("speak"):
		return animal.call("speak")
	return "..."

func _ready():
	var animals = [Dog.new(), Cat.new()]
	for animal in animals:
		print(make_it_speak(animal))
