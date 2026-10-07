extends Node

class Entity:
	var name: String

	func _init(n: String):
		name = n

func _ready():
	var strong = Entity.new("Player")
	var weak = weakref(strong)

	var ref = weak.get_ref()
	if ref:
		print("still alive: ", ref.name)

	strong = null

	var after = weak.get_ref()
	if after == null:
		print("reference was collected")
	else:
		print("still alive: ", after.name)
