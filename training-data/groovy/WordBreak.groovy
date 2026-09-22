def wordBreak(String s, List<String> wordDict) {
    def words = wordDict as Set
    int n = s.length()
    boolean[] dp = new boolean[n + 1]
    dp[0] = true
    for (int i = 1; i <= n; i++) {
        for (int j = 0; j < i; j++) {
            if (dp[j] && words.contains(s.substring(j, i))) {
                dp[i] = true
                break
            }
        }
    }
    return dp[n]
}

println wordBreak("leetcode", ["leet", "code"])
println wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])
