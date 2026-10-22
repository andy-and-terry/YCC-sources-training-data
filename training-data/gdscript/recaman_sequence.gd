extends Node

# Recaman: a(n) = a(n-1) - n if positive and unseen, else a(n-1) + n
func recaman(count: int) -> Array:
	var terms := [0]
	var seen := {0: true}
	var cur := 0
	for i in range(1, count):
		var nxt := cur - i
		if nxt < 0 or seen.has(nxt):
			nxt = cur + i
		seen[nxt] = true
		terms.append(nxt)
		cur = nxt
	return terms

func _ready():
	print(recaman(20))
