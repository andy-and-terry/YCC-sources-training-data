extends Node

class LFUCache:
	var capacity: int
	var values: Dictionary = {}
	var frequency: Dictionary = {}
	var last_used: Dictionary = {}
	var tick: int = 0

	func _init(cap: int):
		capacity = cap

	func get_value(key):
		if not values.has(key):
			return null
		tick += 1
		frequency[key] += 1
		last_used[key] = tick
		return values[key]

	func put(key, value) -> void:
		if values.has(key):
			values[key] = value
			tick += 1
			frequency[key] += 1
			last_used[key] = tick
			return

		if values.size() >= capacity:
			_evict()

		tick += 1
		values[key] = value
		frequency[key] = 1
		last_used[key] = tick

	func _evict() -> void:
		var evict_key = null
		for key in values.keys():
			if evict_key == null:
				evict_key = key
			elif frequency[key] < frequency[evict_key]:
				evict_key = key
			elif frequency[key] == frequency[evict_key] and last_used[key] < last_used[evict_key]:
				evict_key = key
		values.erase(evict_key)
		frequency.erase(evict_key)
		last_used.erase(evict_key)

func _ready():
	var cache = LFUCache.new(2)
	cache.put("a", 1)
	cache.put("b", 2)
	print(cache.get_value("a"))

	cache.put("c", 3)
	print(cache.get_value("b"))
	print(cache.get_value("a"))
	print(cache.get_value("c"))
