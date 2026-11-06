# Bulls and Cows scoring for equal-length digit strings.
extends Node

func score(secret: String, guess: String) -> Vector2i:
	var bulls := 0
	var sc := {}
	var gc := {}
	for i in secret.length():
		var s := secret[i]
		var g := guess[i]
		if s == g:
			bulls += 1
		else:
			sc[s] = sc.get(s, 0) + 1
			gc[g] = gc.get(g, 0) + 1
	var cows := 0
	for c in sc:
		cows += mini(sc[c], gc.get(c, 0))
	return Vector2i(bulls, cows)

func _ready() -> void:
	var r := score("1807", "7810")
	print("%d bull(s), %d cow(s)" % [r.x, r.y])
