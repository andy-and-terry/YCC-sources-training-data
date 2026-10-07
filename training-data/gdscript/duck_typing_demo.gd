extends Node

class Duck:
	func make_sound() -> String:
		return "Quack!"

class Dog:
	func make_sound() -> String:
		return "Woof!"

class Rock:
	func exists() -> bool:
		return true

func make_it_speak(thing) -> void:
	if thing.has_method("make_sound"):
		print(thing.make_sound())
	else:
		print("this thing cannot speak")

func _ready():
	var things = [Duck.new(), Dog.new(), Rock.new()]
	for thing in things:
		make_it_speak(thing)
