extends Node

enum State { IDLE, RUN, JUMP }
var state: State = State.IDLE

func _process(_delta):
    match state:
        State.IDLE: print("idle")
        State.RUN: print("run")
        State.JUMP: print("jump")
