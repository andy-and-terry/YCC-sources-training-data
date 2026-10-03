local function word_break(s, word_dict)
  local words = {}
  for _, w in ipairs(word_dict) do words[w] = true end

  local n = #s
  local dp = {}
  dp[0] = true
  for i = 1, n do
    dp[i] = false
    for j = 0, i - 1 do
      if dp[j] and words[s:sub(j + 1, i)] then
        dp[i] = true
        break
      end
    end
  end
  return dp[n]
end

print(word_break("leetcode", { "leet", "code" }))
print(word_break("applepenapple", { "apple", "pen" }))
print(word_break("catsandog", { "cats", "dog", "sand", "and", "cat" }))
