extends Node

signal step_done

func do_step(label: String, delay_ms: int) -> void:
	await get_tree().create_timer(delay_ms / 1000.0).timeout
	print(label, " finished")
	step_done.emit()

func run_sequence() -> void:
	print("sequence start")
	await do_step("step one", 10)
	await do_step("step two", 10)
	print("sequence complete")

func _ready():
	run_sequence()
