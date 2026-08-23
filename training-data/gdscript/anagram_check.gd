extends Node

func normalize(s: String) -> String:
	var chars = []
	for c in s.to_lower():
		if c != " ":
			chars.append(c)
	chars.sort()
	return "".join(chars)

func is_anagram(a: String, b: String) -> bool:
	return normalize(a) == normalize(b)

func _ready():
	print(is_anagram("listen", "silent"))
	print(is_anagram("hello", "world"))
