extends Node

class HashTable:
	var buckets: Array = []
	var size: int

	func _init(bucket_count: int = 8):
		size = bucket_count
		buckets.resize(size)
		for i in range(size):
			buckets[i] = []

	func _hash(key: String) -> int:
		var h = 0
		for c in key:
			h = (h * 31 + c.unicode_at(0)) % size
		return h

	func put(key: String, value):
		var idx = _hash(key)
		for pair in buckets[idx]:
			if pair[0] == key:
				pair[1] = value
				return
		buckets[idx].append([key, value])

	func get_value(key: String):
		var idx = _hash(key)
		for pair in buckets[idx]:
			if pair[0] == key:
				return pair[1]
		return null

func _ready():
	var table = HashTable.new()
	table.put("alice", 30)
	table.put("bob", 25)
	table.put("alice", 31)
	print(table.get_value("alice"))
	print(table.get_value("bob"))
	print(table.get_value("carol"))
