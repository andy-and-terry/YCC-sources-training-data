extends Node

func lcs(a: String, b: String) -> String:
	var m = a.length()
	var n = b.length()
	var dp = []
	for i in range(m + 1):
		var row = []
		row.resize(n + 1)
		row.fill(0)
		dp.append(row)
	for i in range(1, m + 1):
		for j in range(1, n + 1):
			if a[i - 1] == b[j - 1]:
				dp[i][j] = dp[i - 1][j - 1] + 1
			else:
				dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
	var result = ""
	var i = m
	var j = n
	while i > 0 and j > 0:
		if a[i - 1] == b[j - 1]:
			result = a[i - 1] + result
			i -= 1
			j -= 1
		elif dp[i - 1][j] >= dp[i][j - 1]:
			i -= 1
		else:
			j -= 1
	return result

func _ready():
	print(lcs("ABCBDAB", "BDCABA"))
