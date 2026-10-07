extends Node

class Temperature:
	var _celsius: float = 0.0

	var celsius: float:
		get:
			return _celsius
		set(value):
			_celsius = value

	var fahrenheit: float:
		get:
			return _celsius * 9.0 / 5.0 + 32.0
		set(value):
			_celsius = (value - 32.0) * 5.0 / 9.0

func _ready():
	var t = Temperature.new()
	t.celsius = 100.0
	print(t.fahrenheit)
	t.fahrenheit = 32.0
	print(t.celsius)
