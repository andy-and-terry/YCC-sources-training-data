extends Node

func sum_all(values: Array[int]) -> int:
	var total := 0
	for v in values:
		total += v
	return total

func _ready():
	var nums: Array[int] = [1, 2, 3]
	nums.append(4)
	print(sum_all(nums))

	var names: Array[String] = ["b", "a"]
	names.sort()
	print(names)

	var scores: Dictionary[String, int] = {"ann": 3, "bob": 5}
	scores["cid"] = 7
	for key in scores:
		print(key, " ", scores[key])
	print(scores.keys(), " ", scores.values())
	print(scores.get("zed", -1))
	print(nums.map(func(x): return x * x))
	print(nums.filter(func(x): return x % 2 == 0))
	print(nums.reduce(func(acc, x): return acc + x, 0))
