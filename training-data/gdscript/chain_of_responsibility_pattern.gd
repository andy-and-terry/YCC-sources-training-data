extends Node

class Handler:
	var next_handler

	func set_next(handler):
		next_handler = handler
		return handler

	func handle(request: int):
		if next_handler != null:
			return next_handler.handle(request)
		return "unhandled: %d" % request

class LowHandler extends Handler:
	func handle(request: int):
		if request < 10:
			return "low handler: %d" % request
		return super.handle(request)

class MidHandler extends Handler:
	func handle(request: int):
		if request < 100:
			return "mid handler: %d" % request
		return super.handle(request)

class HighHandler extends Handler:
	func handle(request: int):
		return "high handler: %d" % request

func _ready():
	var low = LowHandler.new()
	var mid = MidHandler.new()
	var high = HighHandler.new()
	low.set_next(mid).set_next(high)

	for value in [5, 50, 500]:
		print(low.handle(value))
