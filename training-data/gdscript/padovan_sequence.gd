extends SceneTree

# Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
func padovan(count: int) -> Array:
	var p := []
	for i in count:
		p.append(1 if i < 3 else p[i - 2] + p[i - 3])
	return p

func _init():
	print(padovan(15))
	quit()
