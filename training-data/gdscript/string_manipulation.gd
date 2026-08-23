extends Node

func _ready():
	var s = "Hello, GDScript World!"
	print(s.to_upper())
	print(s.to_lower())
	print(s.length())
	print(s.split(" "))
	print(s.replace("World", "Programming"))
