extends Node

enum State { IDLE, RUN, JUMP }
var state: State = State.IDLE

func step() -> void:
	match state:
		State.IDLE: state = State.RUN
		State.RUN: state = State.JUMP
		State.JUMP: state = State.IDLE
