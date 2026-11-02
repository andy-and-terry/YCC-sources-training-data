extends Node

enum State { IDLE, RUN, JUMP }
var state = State.IDLE

func _ready():
    match state:
        State.IDLE: print("idle")
        State.RUN: print("run")
        _: print("other")
