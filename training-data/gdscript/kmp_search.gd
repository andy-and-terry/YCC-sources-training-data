extends Node

func build_lps(pattern: String) -> Array:
	var n = pattern.length()
	var lps = []
	lps.resize(n)
	lps.fill(0)
	var length = 0
	var i = 1
	while i < n:
		if pattern[i] == pattern[length]:
			length += 1
			lps[i] = length
			i += 1
		elif length != 0:
			length = lps[length - 1]
		else:
			lps[i] = 0
			i += 1
	return lps

func kmp_search(text: String, pattern: String) -> int:
	var lps = build_lps(pattern)
	var n = text.length()
	var m = pattern.length()
	var i = 0
	var j = 0
	while i < n:
		if text[i] == pattern[j]:
			i += 1
			j += 1
			if j == m:
				return i - j
		elif j > 0:
			j = lps[j - 1]
		else:
			i += 1
	return -1

func _ready():
	print(kmp_search("abxabcabcaby", "abcaby"))
