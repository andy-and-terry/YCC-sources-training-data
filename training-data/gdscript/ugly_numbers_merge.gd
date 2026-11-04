extends Node

func ugly(n: int) -> int:
	var seq: Array[int] = [1]
	var i2 := 0
	var i3 := 0
	var i5 := 0
	while seq.size() < n:
		var c2 := seq[i2] * 2
		var c3 := seq[i3] * 3
		var c5 := seq[i5] * 5
		var next := mini(c2, mini(c3, c5))
		seq.append(next)
		if next == c2: i2 += 1
		if next == c3: i3 += 1
		if next == c5: i5 += 1
	return seq[n - 1]

func _ready() -> void:
	var out := []
	for i in range(1, 13):
		out.append(ugly(i))
	print(out)
