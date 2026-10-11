extends Node

func with_commas(n: int) -> String:
	var s = str(abs(n))
	var out = ""
	var count = 0
	for i in range(s.length() - 1, -1, -1):
		out = s[i] + out
		count += 1
		if count % 3 == 0 and i > 0:
			out = "," + out
	return ("-" if n < 0 else "") + out

func _ready():
	print(with_commas(0))
	print(with_commas(1234))
	print(with_commas(-9876543))
	print(String.num(3.14159, 2), String.num_int64(255, 16))
	print("%05d|%-6s|%+.1f" % [42, "ab", 2.55])
	print("%x %o" % [255, 8])
