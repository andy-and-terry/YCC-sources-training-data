extends Node

const DIGITS := "0123456789abcdefghijklmnopqrstuvwxyz"

func to_base(n: int, base: int) -> String:
	if n == 0:
		return "0"
	var out := ""
	while n > 0:
		out = DIGITS[n % base] + out
		n /= base
	return out

func _ready() -> void:
	for b in [2, 8, 16, 36]:
		print("255 in base %d = %s" % [b, to_base(255, b)])
	print("ff".hex_to_int(), " ", "1010".bin_to_int())
