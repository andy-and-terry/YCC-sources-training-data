extends SceneTree

func duval(s: String) -> PackedStringArray:
	var out := PackedStringArray()
	var i := 0
	var n := s.length()
	while i < n:
		var j := i + 1
		var k := i
		while j < n and s[k] <= s[j]:
			k = i if s[k] < s[j] else k + 1
			j += 1
		while i <= k:
			out.append(s.substr(i, j - k))
			i += j - k
	return out

func _init():
	print(duval("banana"))
	quit()
