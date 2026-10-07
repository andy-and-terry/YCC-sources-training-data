extends Node

class SkipNode:
	var value: int
	var forward: Array = []

	func _init(v: int, level: int) -> void:
		value = v
		forward.resize(level + 1)

class SkipList:
	const MAX_LEVEL := 4
	var head := SkipNode.new(-1, MAX_LEVEL)
	var level := 0

	func _random_level() -> int:
		var lvl := 0
		while randf() < 0.5 and lvl < MAX_LEVEL:
			lvl += 1
		return lvl

	func insert(value: int) -> void:
		var update := []
		update.resize(MAX_LEVEL + 1)
		var current := head
		for i in range(level, -1, -1):
			while current.forward[i] != null and current.forward[i].value < value:
				current = current.forward[i]
			update[i] = current
		var new_level := _random_level()
		if new_level > level:
			for i in range(level + 1, new_level + 1):
				update[i] = head
			level = new_level
		var node := SkipNode.new(value, new_level)
		for i in range(new_level + 1):
			node.forward[i] = update[i].forward[i]
			update[i].forward[i] = node

	func contains(value: int) -> bool:
		var current := head
		for i in range(level, -1, -1):
			while current.forward[i] != null and current.forward[i].value < value:
				current = current.forward[i]
		current = current.forward[0]
		return current != null and current.value == value

func _ready():
	var list := SkipList.new()
	for v in [3, 6, 7, 9, 12, 19, 17]:
		list.insert(v)
	print("contains 9: %s" % list.contains(9))
	print("contains 100: %s" % list.contains(100))
