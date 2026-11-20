extends Node
# Remove consecutive duplicate characters.
func dedupe(s: String) -> String:
	var out := ""
	for i in s.length():
		if i == 0 or s[i] != s[i - 1]: out += s[i]
	return out

func _ready():
	print(dedupe("aabbbcdd"))
