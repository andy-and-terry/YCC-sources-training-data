extends Node

func _ready():
	print(lerp(0.0, 10.0, 0.25))
	print(clamp(15, 0, 10), snappedf(3.14159, 0.01))
	print(wrapi(7, 0, 5), remap(5, 0, 10, 100, 200))
	print(deg_to_rad(180.0), sign(-3))
