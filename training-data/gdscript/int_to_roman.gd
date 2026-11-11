# Integer (1..3999) to Roman numeral using a greedy table.
extends Node

const VALUES := [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
const SYMBOLS := ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

func to_roman(n: int) -> String:
	var out := ""
	for i in VALUES.size():
		while n >= VALUES[i]:
			out += SYMBOLS[i]
			n -= VALUES[i]
	return out

func _ready() -> void:
	print(to_roman(1994), " ", to_roman(58))
