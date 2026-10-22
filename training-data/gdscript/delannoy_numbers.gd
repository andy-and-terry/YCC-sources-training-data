extends Node

# Central Delannoy numbers: D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)
func central(last: int) -> Array:
	var d := []
	var diagonal := []
	for m in range(last + 1):
		var row := []
		for n in range(last + 1):
			if m == 0 or n == 0:
				row.append(1)
			else:
				row.append(d[m - 1][n] + row[n - 1] + d[m - 1][n - 1])
		d.append(row)
		diagonal.append(row[m])
	return diagonal

func _ready():
	print(" ".join(central(9).map(func(x): return str(x))))
