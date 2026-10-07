extends Node

func z_array(s: String) -> Array:
	var n := s.length()
	var z := []
	z.resize(n)
	z.fill(0)
	var l := 0
	var r := 0
	for i in range(1, n):
		if i < r:
			z[i] = min(r - i, z[i - l])
		while i + z[i] < n and s[z[i]] == s[i + z[i]]:
			z[i] += 1
		if i + z[i] > r:
			l = i
			r = i + z[i]
	return z

func search(text: String, pattern: String) -> Array:
	var combined := pattern + "$" + text
	var z := z_array(combined)
	var matches := []
	var plen := pattern.length()
	for i in range(plen + 1, z.size()):
		if z[i] == plen:
			matches.append(i - plen - 1)
	return matches

func _ready():
	var result := search("abxabcabcaby", "abc")
	print("matches at: %s" % [result])
