extends SceneTree

func gcd_i(a: int, b: int) -> int:
	while b != 0:
		var t := a % b
		a = b
		b = t
	return a

func rho(n: int) -> int:
	if n % 2 == 0:
		return 2
	var x := 2
	var y := 2
	var d := 1
	while d == 1:
		x = (x * x + 1) % n
		y = (y * y + 1) % n
		y = (y * y + 1) % n
		d = gcd_i(absi(x - y), n)
	return d

func _init():
	var n := 8051
	var p := rho(n)
	print("%d = %d * %d" % [n, p, n / p])
	quit()
