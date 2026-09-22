extends Node

const BASE = 256
const MOD = 1000000007

func rabin_karp_search(text: String, pattern: String) -> Array:
	var matches = []
	var n = text.length()
	var m = pattern.length()
	if m > n or m == 0:
		return matches

	var high_order = 1
	for i in range(m - 1):
		high_order = (high_order * BASE) % MOD

	var pattern_hash = 0
	var window_hash = 0
	for i in range(m):
		pattern_hash = (pattern_hash * BASE + pattern.unicode_at(i)) % MOD
		window_hash = (window_hash * BASE + text.unicode_at(i)) % MOD

	for i in range(n - m + 1):
		if pattern_hash == window_hash and text.substr(i, m) == pattern:
			matches.append(i)
		if i < n - m:
			window_hash = (window_hash - text.unicode_at(i) * high_order % MOD + MOD) % MOD
			window_hash = (window_hash * BASE + text.unicode_at(i + m)) % MOD

	return matches

func _ready():
	print(rabin_karp_search("abxabcabcaby", "abc"))
