extends Node

func _ready():
	var red = Color(1, 0, 0)
	var half = Color(0, 0, 1, 0.5)
	print(red, half.a)
	print(Color.from_hsv(0.33, 1.0, 1.0))
	print(Color("#ff8800").to_html(false))
	print(red.lerp(Color.BLUE, 0.5))
	print(red.darkened(0.5), red.lightened(0.5))
	print(Color8(255, 128, 0))
	print(red.inverted())
	print(Color.WHITE == Color(1, 1, 1))
	print(half.to_rgba32())
