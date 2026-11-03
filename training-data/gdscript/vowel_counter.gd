extends Node

func count_vowels(s: String) -> Dictionary:
	var counts := {"a": 0, "e": 0, "i": 0, "o": 0, "u": 0}
	for c in s.to_lower():
		if counts.has(c):
			counts[c] += 1
	return counts

func _ready() -> void:
	print(count_vowels("Education is beautiful"))
