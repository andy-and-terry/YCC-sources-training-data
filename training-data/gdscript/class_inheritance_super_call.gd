extends Node

class Animal:
	func speak():
		return "..."

class Dog extends Animal:
	func speak():
		return super.speak() + "woof"

func _ready():
	print(Dog.new().speak())
