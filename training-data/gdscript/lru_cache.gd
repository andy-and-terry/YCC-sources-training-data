extends Node

class LRUCache:
	var capacity: int
	var map = {}
	var order = []

	func _init(cap: int):
		capacity = cap

	func get_value(key):
		if map.has(key):
			order.erase(key)
			order.append(key)
			return map[key]
		return null

	func put(key, value):
		if map.has(key):
			order.erase(key)
		map[key] = value
		order.append(key)
		if order.size() > capacity:
			var evict = order.pop_front()
			map.erase(evict)

func _ready():
	var cache = LRUCache.new(2)
	cache.put(1, "a")
	cache.put(2, "b")
	print(cache.get_value(1))
	cache.put(3, "c")
	print(cache.get_value(2))
