extends Node

func _ready():
	for i in 5:
		print(i)

	for i in range(2, 10, 3):
		print("step ", i)

	for i in range(5, 0, -2):
		print("down ", i)

	var fruits := ["apple", "banana", "cherry"]
	for i in fruits.size():
		print(i, ": ", fruits[i])

	for c in "abc":
		print(c)

	var scores := {"ann": 3, "bo": 5}
	for key in scores:
		print(key, "=", scores[key])

	var n := 0
	while n < 3:
		n += 1
		if n == 2:
			continue
		print("while ", n)

	var found := -1
	for i in range(100):
		if i * i > 50:
			found = i
			break
	print("first i with i*i>50: ", found)
	print("even" if found % 2 == 0 else "odd")
