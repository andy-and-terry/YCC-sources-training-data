extends Node

class TreeType:
	var name: String
	var color: String
	var texture: String

	func _init(n: String, c: String, t: String) -> void:
		name = n
		color = c
		texture = t

	func render(x: int, y: int) -> void:
		print("tree %s (%s, %s) at (%d, %d)" % [name, color, texture, x, y])

class TreeFactory:
	var _cache: Dictionary = {}

	func get_type(name: String, color: String, texture: String) -> TreeType:
		var key := "%s_%s_%s" % [name, color, texture]
		if not _cache.has(key):
			_cache[key] = TreeType.new(name, color, texture)
			print("created new shared TreeType for %s" % key)
		return _cache[key]

func _ready():
	var factory := TreeFactory.new()
	var positions := [[0, 0], [5, 5], [10, 10]]
	for pos in positions:
		var t := factory.get_type("oak", "green", "bark_01")
		t.render(pos[0], pos[1])
	print("unique flyweight objects: %d" % factory._cache.size())
