import std/sets

proc wordBreak(s: string, wordDict: seq[string]): bool =
  let words = wordDict.toHashSet
  var dp = newSeq[bool](s.len + 1)
  dp[0] = true
  for i in 1 .. s.len:
    for j in 0 ..< i:
      if dp[j] and s[j ..< i] in words:
        dp[i] = true
        break
  result = dp[s.len]

echo wordBreak("leetcode", @["leet", "code"])
echo wordBreak("applepenapple", @["apple", "pen"])
echo wordBreak("catsandog", @["cats", "dog", "sand", "and", "cat"])
