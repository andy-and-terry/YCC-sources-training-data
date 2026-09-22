extends Node

func edit_distance(a: String, b: String) -> int:
	var m = a.length()
	var n = b.length()
	var dp = []
	for i in range(m + 1):
		var row = []
		row.resize(n + 1)
		row.fill(0)
		dp.append(row)
	for i in range(m + 1):
		dp[i][0] = i
	for j in range(n + 1):
		dp[0][j] = j
	for i in range(1, m + 1):
		for j in range(1, n + 1):
			if a[i - 1] == b[j - 1]:
				dp[i][j] = dp[i - 1][j - 1]
			else:
				dp[i][j] = 1 + min(dp[i - 1][j - 1], min(dp[i - 1][j], dp[i][j - 1]))
	return dp[m][n]

func _ready():
	print(edit_distance("kitten", "sitting"))
