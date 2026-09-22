func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let words = Set(wordDict)
    let chars = Array(s)
    let n = chars.count
    var dp = Array(repeating: false, count: n + 1)
    dp[0] = true

    for end in 1...n {
        for start in 0..<end {
            if dp[start] && words.contains(String(chars[start..<end])) {
                dp[end] = true
                break
            }
        }
    }
    return dp[n]
}

print(wordBreak("leetcode", ["leet", "code"]))
print(wordBreak("applepenapple", ["apple", "pen"]))
print(wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
