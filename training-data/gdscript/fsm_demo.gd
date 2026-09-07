extends Node

class StateMachine:
	var current: String
	var transitions: Dictionary

	func _init(start: String, table: Dictionary):
		current = start
		transitions = table

	func fire(event: String) -> bool:
		var options = transitions.get(current, {})
		if options.has(event):
			current = options[event]
			return true
		return false

func _ready():
	var table = {
		"idle": {"start": "running"},
		"running": {"jump": "jumping", "stop": "idle"},
		"jumping": {"land": "running"}
	}
	var fsm = StateMachine.new("idle", table)
	for event in ["start", "jump", "land", "stop"]:
		fsm.fire(event)
		print(fsm.current)
	print(fsm.fire("jump"))
