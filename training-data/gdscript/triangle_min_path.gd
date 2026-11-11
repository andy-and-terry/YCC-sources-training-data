func minimum_total(t: Array) -> int:
	var dp: Array = t[t.size() - 1].duplicate()
	for r in range(t.size() - 2, -1, -1):
		for i in t[r].size():
			dp[i] = t[r][i] + min(dp[i], dp[i + 1])
	return dp[0]

func _ready() -> void:
	print(minimum_total([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]))  # 11
