extends Node

func reverse_words(s: String) -> String:
	var words = s.split(" ", false)
	words.reverse()
	return " ".join(words)

func reverse_in_place(chars: Array) -> Array:
	var i = 0
	var j = chars.size() - 1
	while i < j:
		var t = chars[i]
		chars[i] = chars[j]
		chars[j] = t
		i += 1
		j -= 1
	return chars

func _ready():
	print(reverse_words("the sky  is blue"))
	print(reverse_in_place(["h", "e", "l", "l", "o"]))
