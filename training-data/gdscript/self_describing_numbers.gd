extends Node

func is_self_describing(s: String) -> bool:
	for i in s.length():
		if s.count(str(i)) != int(s[i]):
			return false
	return true

func _ready() -> void:
	for s in ["1210", "2020", "21200", "1211"]:
		print(s, " ", is_self_describing(s))
