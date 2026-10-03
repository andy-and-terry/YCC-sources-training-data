extends Node

class Handler:
	var next_handler: Handler = null

	func set_next(h: Handler) -> Handler:
		next_handler = h
		return h

	func handle(amount: int) -> void:
		if next_handler != null:
			next_handler.handle(amount)

class SmallApprover extends Handler:
	func handle(amount: int) -> void:
		if amount <= 100:
			print("small approver handled %d" % amount)
		else:
			super.handle(amount)

class ManagerApprover extends Handler:
	func handle(amount: int) -> void:
		if amount <= 1000:
			print("manager handled %d" % amount)
		else:
			super.handle(amount)

class DirectorApprover extends Handler:
	func handle(amount: int) -> void:
		print("director handled %d" % amount)

func _ready():
	var chain := SmallApprover.new()
	chain.set_next(ManagerApprover.new()).set_next(DirectorApprover.new())
	chain.handle(50)
	chain.handle(500)
	chain.handle(5000)
