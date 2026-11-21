extends SceneTree

# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
func is_bouncy(n: int) -> bool:
	var s := str(n)
	var inc := true
	var dec := true
	for i in range(1, s.length()):
		if s[i - 1] > s[i]:
			inc = false
		if s[i - 1] < s[i]:
			dec = false
	return not inc and not dec

func _init() -> void:
	var count := 0
	for n in range(1, 1000):
		if is_bouncy(n):
			count += 1
	print(count)
	quit()
