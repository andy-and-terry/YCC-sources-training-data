extends Node

enum State { IDLE, RUN, JUMP }
var state = State.IDLE

func step():
	match state:
		State.IDLE:
			state = State.RUN
		State.RUN:
			state = State.JUMP
		_:
			state = State.IDLE
	print(State.keys()[state])
