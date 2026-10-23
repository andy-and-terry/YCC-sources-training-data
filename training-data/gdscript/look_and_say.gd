extends Node

func next_term(s: String) -> String:
	var out := ""
	var i := 0
	while i < s.length():
		var j := i
		while j < s.length() and s[j] == s[i]:
			j += 1
		out += str(j - i) + s[i]
		i = j
	return out

func _ready():
	var s := "1"
	for _n in range(7):
		print(s)
		s = next_term(s)
