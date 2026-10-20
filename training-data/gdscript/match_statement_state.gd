extends Node

enum State { IDLE, RUN, JUMP }

func describe(s: State) -> String:
	match s:
		State.IDLE: return "idle"
		State.RUN, State.JUMP: return "moving"
	return "?"

func _ready():
	print(describe(State.RUN))
