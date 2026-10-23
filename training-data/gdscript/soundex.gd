extends Node

const CODES := {"b": "1", "f": "1", "p": "1", "v": "1",
	"c": "2", "g": "2", "j": "2", "k": "2", "q": "2", "s": "2", "x": "2", "z": "2",
	"d": "3", "t": "3", "l": "4", "m": "5", "n": "5", "r": "6"}

func soundex(word: String) -> String:
	var w := word.to_lower()
	if w.is_empty():
		return ""
	var out := w[0].to_upper()
	var last: String = CODES.get(w[0], "")
	for i in range(1, w.length()):
		var ch := w[i]
		var code: String = CODES.get(ch, "")
		if code != "" and code != last:
			out += code
		if ch != "h" and ch != "w":
			last = code
	return (out + "000").substr(0, 4)

func _ready() -> void:
	for name in ["Robert", "Rupert", "Tymczak", "Pfister", "Honeyman"]:
		print("%s -> %s" % [name, soundex(name)])
