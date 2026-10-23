extends RefCounted

var _data: Dictionary = {"hp": 10}

func _get(property: StringName) -> Variant:
	if _data.has(property):
		return _data[property]
	return null

func _set(property: StringName, value: Variant) -> bool:
	if property == &"hp":
		_data[property] = clampi(value, 0, 100)
		return true
	return false

func _init() -> void:
	set("hp", 250)
	print(get("hp"))
	set("hp", -5)
	print(get("hp"))
