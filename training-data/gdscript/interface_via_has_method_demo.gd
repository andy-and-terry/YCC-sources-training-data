extends Node

class Duck:
	func speak(): return "quack"

class Robot:
	func speak(): return "beep"

class Rock:
	pass

func _ready():
	for thing in [Duck.new(), Robot.new(), Rock.new()]:
		if thing.has_method("speak"):
			print(thing.speak())
		else:
			print("cannot speak")
	var d = Duck.new()
	print(d.call("speak"))
	print(d.get_script() != null)
