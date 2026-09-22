extends Node

class State:
	func enter(actor) -> void:
		pass

	func handle_input(actor, action: String) -> void:
		pass

	func state_name() -> String:
		return "State"

class IdleState extends State:
	func handle_input(actor, action: String) -> void:
		if action == "move":
			actor.change_state(RunningState.new())

	func state_name() -> String:
		return "Idle"

class RunningState extends State:
	func enter(actor) -> void:
		print("started running")

	func handle_input(actor, action: String) -> void:
		if action == "stop":
			actor.change_state(IdleState.new())
		elif action == "jump":
			actor.change_state(JumpingState.new())

	func state_name() -> String:
		return "Running"

class JumpingState extends State:
	func enter(actor) -> void:
		print("jumped")

	func handle_input(actor, action: String) -> void:
		if action == "land":
			actor.change_state(IdleState.new())

	func state_name() -> String:
		return "Jumping"

class Actor:
	var state: State = IdleState.new()

	func change_state(new_state: State) -> void:
		state = new_state
		state.enter(self)

	func input(action: String) -> void:
		state.handle_input(self, action)

func _ready():
	var actor = Actor.new()
	for action in ["move", "jump", "land", "stop"]:
		actor.input(action)
		print(actor.state.state_name())
