extends Node

class Command:
	func execute() -> void:
		pass

	func undo() -> void:
		pass

class AddCommand extends Command:
	var target: Array
	var amount: int

	func _init(t: Array, a: int):
		target = t
		amount = a

	func execute() -> void:
		target[0] += amount

	func undo() -> void:
		target[0] -= amount

class CommandHistory:
	var history: Array = []

	func run(cmd: Command) -> void:
		cmd.execute()
		history.append(cmd)

	func undo_last() -> void:
		if history.is_empty():
			return
		var cmd = history.pop_back()
		cmd.undo()

func _ready():
	var counter = [0]
	var history = CommandHistory.new()
	history.run(AddCommand.new(counter, 5))
	history.run(AddCommand.new(counter, 3))
	print(counter[0])
	history.undo_last()
	print(counter[0])
