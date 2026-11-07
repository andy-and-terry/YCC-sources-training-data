func add_binary(a: String, b: String) -> String:
	var i := a.length() - 1
	var j := b.length() - 1
	var carry := 0
	var out := ""
	while i >= 0 or j >= 0 or carry > 0:
		var s := carry
		if i >= 0:
			s += int(a[i])
			i -= 1
		if j >= 0:
			s += int(b[j])
			j -= 1
		out = str(s % 2) + out
		carry = s / 2
	return out

func _ready() -> void:
	print(add_binary("1010", "1011"))  # 10101
