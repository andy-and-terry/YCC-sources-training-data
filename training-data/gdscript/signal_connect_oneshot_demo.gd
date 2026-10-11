extends Node

signal finished(result: int)

func _ready():
	finished.connect(_on_finished, CONNECT_ONE_SHOT)
	finished.connect(func(r): print("lambda got ", r))
	finished.emit(1)
	finished.emit(2)
	print(finished.is_connected(_on_finished))
	print(finished.get_connections().size())

func _on_finished(result: int):
	print("one-shot handler: ", result)
