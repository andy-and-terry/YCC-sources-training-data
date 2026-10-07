extends Node

func sum_all(values: Array[int]) -> int:
	var total := 0
	for v in values:
		total += v
	return total

func names_of(nodes: Array[Node]) -> Array[String]:
	var out: Array[String] = []
	for n in nodes:
		out.append(String(n.name))
	return out

func _ready():
	var ints: Array[int] = [1, 2, 3]
	ints.append(4)
	print(sum_all(ints))

	var words: Array[String] = ["b", "a", "c"]
	words.sort()
	print(words)

	var vectors: Array[Vector2] = [Vector2(1, 2), Vector2(3, 4)]
	var total := Vector2.ZERO
	for v in vectors:
		total += v
	print(total)

	var a := Node.new()
	a.name = "Alpha"
	var b := Node.new()
	b.name = "Beta"
	print(names_of([a, b]))
	a.free()
	b.free()

	var untyped := [1, "two", 3.0]
	var typed: Array[int] = []
	typed.assign(untyped.filter(func(x): return x is int))
	print(typed, typed.is_typed(), untyped.is_typed())
	print(typed.get_typed_builtin() == TYPE_INT)
