extends Node

class TrafficController:
	enum Light { RED, YELLOW, GREEN }

	var state: Light = Light.RED

	func next() -> void:
		match state:
			Light.RED:
				state = Light.GREEN
			Light.GREEN:
				state = Light.YELLOW
			Light.YELLOW:
				state = Light.RED

	func state_name() -> String:
		match state:
			Light.RED:
				return "RED"
			Light.GREEN:
				return "GREEN"
			Light.YELLOW:
				return "YELLOW"
			_:
				return "UNKNOWN"

func _ready():
	var controller = TrafficController.new()
	for i in range(5):
		print(controller.state_name())
		controller.next()
