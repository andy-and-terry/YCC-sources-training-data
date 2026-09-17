func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let words = Set(wordDict)
    let chars = Array(s)
    var dp = [Bool](repeating: false, count: chars.count + 1)
    dp[0] = true

    for end in 1...chars.count {
        for start in 0..<end where dp[start] {
            let word = String(chars[start..<end])
            if words.contains(word) {
                dp[end] = true
                break
            }
        }
    }
    return dp[chars.count]
}

print(wordBreak("leetcode", ["leet", "code"]))      // true
print(wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])) // false
