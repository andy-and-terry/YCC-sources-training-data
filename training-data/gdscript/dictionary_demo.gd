extends Node

func _ready():
	var scores = {"Ada": 88, "Bob": 72, "Cleo": 95}
	for name in scores:
		print(name, ": ", scores[name])
	print("has Ada: ", scores.has("Ada"))
	scores["Dan"] = 60
	print(scores.size())
