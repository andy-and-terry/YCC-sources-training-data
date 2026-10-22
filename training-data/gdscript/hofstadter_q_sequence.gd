extends Node

# Hofstadter Q: Q(1) = Q(2) = 1, Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2))
func hofstadter_q(count: int) -> Array:
	var q := [0, 1, 1]  # index 0 unused
	for n in range(3, count + 1):
		q.append(q[n - q[n - 1]] + q[n - q[n - 2]])
	q.remove_at(0)
	return q

func _ready():
	print(hofstadter_q(20))
