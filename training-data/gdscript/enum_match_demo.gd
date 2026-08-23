extends Node

enum State { IDLE, RUNNING, JUMPING, FALLING }

func describe_state(state: State) -> String:
	match state:
		State.IDLE:
			return "Standing still"
		State.RUNNING:
			return "Running"
		State.JUMPING:
			return "Jumping"
		State.FALLING:
			return "Falling"
		_:
			return "Unknown"

func _ready():
	print(describe_state(State.RUNNING))
	print(describe_state(State.FALLING))
