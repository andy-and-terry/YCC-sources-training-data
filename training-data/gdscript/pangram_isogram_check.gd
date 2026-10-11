extends Node

func is_pangram(s: String) -> bool:
	var seen = {}
	for ch in s.to_lower():
		if ch >= "a" and ch <= "z":
			seen[ch] = true
	return seen.size() == 26

func is_isogram(s: String) -> bool:
	var seen = {}
	for ch in s.to_lower():
		if ch == " " or ch == "-":
			continue
		if seen.has(ch):
			return false
		seen[ch] = true
	return true

func _ready():
	print(is_pangram("The quick brown fox jumps over the lazy dog"))
	print(is_pangram("hello"))
	print(is_isogram("lumberjack"), is_isogram("alphabet"))
