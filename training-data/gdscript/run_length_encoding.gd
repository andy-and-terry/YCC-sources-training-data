extends Node

func encode(s: String) -> String:
	if s.is_empty():
		return ""
	var out := ""
	var count := 1
	for i in range(1, s.length()):
		if s[i] == s[i - 1]:
			count += 1
		else:
			out += str(count) + s[i - 1]
			count = 1
	return out + str(count) + s[s.length() - 1]

func decode(s: String) -> String:
	var out := ""
	var num := ""
	for ch in s:
		if ch.is_valid_int():
			num += ch
		else:
			out += ch.repeat(int(num))
			num = ""
	return out

func _ready():
	var e := encode("aaabccdddd")
	print(e)
	print(decode(e))
