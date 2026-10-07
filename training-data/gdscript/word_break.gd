extends Node

func word_break(s: String, word_dict: Array) -> bool:
	var n := s.length()
	var dp := []
	dp.resize(n + 1)
	dp.fill(false)
	dp[0] = true
	for i in range(1, n + 1):
		for j in range(i):
			if dp[j] and word_dict.has(s.substr(j, i - j)):
				dp[i] = true
				break
	return dp[n]

func _ready():
	var dict1 := ["leet", "code"]
	print(word_break("leetcode", dict1))
	var dict2 := ["apple", "pen"]
	print(word_break("applepenapple", dict2))
	var dict3 := ["cats", "dog", "sand", "and", "cat"]
	print(word_break("catsandog", dict3))
