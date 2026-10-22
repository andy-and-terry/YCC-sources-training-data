extends Node

# Farey sequence F_n: reduced fractions in [0,1] with denominator <= n
func farey(n: int) -> PackedStringArray:
	var terms := PackedStringArray()
	var a := 0
	var b := 1
	var c := 1
	var d := n
	terms.append("%d/%d" % [a, b])
	while c <= n:
		var k: int = (n + b) / d
		var e := k * c - a
		var f := k * d - b
		a = c
		b = d
		c = e
		d = f
		terms.append("%d/%d" % [a, b])
	return terms

func _ready():
	print(" ".join(farey(5)))
