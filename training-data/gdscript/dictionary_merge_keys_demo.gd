extends Node

func _ready():
	var base = {"hp": 10, "mp": 5}
	var bonus = {"mp": 8, "xp": 3}
	var merged = base.duplicate()
	merged.merge(bonus)
	print(merged)
	var kept = base.duplicate()
	kept.merge(bonus, true)
	print(kept)
	print(base.keys(), base.values())
	print(base.has("hp"), base.has_all(["hp", "mp"]))
	print(base.get("zzz", -1))
	for k in merged:
		print(k, " -> ", merged[k])
	base.erase("hp")
	print(base.size(), base.is_empty())
