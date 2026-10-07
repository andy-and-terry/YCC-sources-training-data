boolean wordBreak(String s, List<String> wordDict) {
    def n = s.length()
    def dp = new boolean[n + 1]
    dp[0] = true
    for (i in 1..n) {
        for (j in 0..<i) {
            if (dp[j] && wordDict.contains(s.substring(j, i))) {
                dp[i] = true
                break
            }
        }
    }
    dp[n]
}

println wordBreak("leetcode", ["leet", "code"])
println wordBreak("applepenapple", ["apple", "pen"])
println wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])
