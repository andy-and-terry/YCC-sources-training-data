extends Node

var states := {}
var current := ""
var log: Array[String] = []

func _ready() -> void:
	states = {
		"idle": {"enter": func(): log.append("enter idle"), "update": _idle_update, "exit": func(): log.append("exit idle")},
		"run": {"enter": func(): log.append("enter run"), "update": _run_update, "exit": func(): log.append("exit run")},
	}
	change("idle")
	for i in 4:
		states[current]["update"].call(i)
	print(log)

func change(next: String) -> void:
	if current != "":
		states[current]["exit"].call()
	current = next
	states[current]["enter"].call()

func _idle_update(tick: int) -> void:
	if tick >= 1:
		change("run")

func _run_update(tick: int) -> void:
	log.append("run tick %d" % tick)
