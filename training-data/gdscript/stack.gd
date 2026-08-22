class_name Stack
extends RefCounted

var items: Array = []

func push(item) -> void:
	items.append(item)

func pop():
	return items.pop_back()

func peek():
	return items[items.size() - 1]

func is_empty() -> bool:
	return items.is_empty()
