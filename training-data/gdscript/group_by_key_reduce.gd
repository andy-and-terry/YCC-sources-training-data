extends Node

func group_by(items: Array, key_fn: Callable) -> Dictionary:
	var out = {}
	for it in items:
		var k = key_fn.call(it)
		if not out.has(k):
			out[k] = []
		out[k].append(it)
	return out

func _ready():
	var words = ["apple", "bob", "cat", "avocado", "bee", "cow"]
	print(group_by(words, func(w): return w[0]))
	print(group_by(range(10), func(n): return n % 3))
	print(words.map(func(w): return w.length()).reduce(func(a, b): return a + b))
