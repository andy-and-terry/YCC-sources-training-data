extends Node

signal changed(value)

class Subject:
	signal value_changed(value)
	var value: int = 0:
		set(v):
			value = v
			value_changed.emit(v)

func _on_value_changed(v):
	print("observer received: %s" % v)

func _ready():
	var subject = Subject.new()
	subject.value_changed.connect(_on_value_changed)
	subject.value = 10
	subject.value = 42
