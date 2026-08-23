extends Node

func is_palindrome(s: String) -> bool:
	var normalized = ""
	for c in s.to_lower():
		if c.is_valid_identifier() or c.is_valid_int():
			normalized += c
	return normalized == normalized.reverse()

func _ready():
	print(is_palindrome("racecar"))
	print(is_palindrome("hello"))
