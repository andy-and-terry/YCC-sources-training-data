func wordBreak(_ s: String, _ wordDict: Set<String>) -> Bool {
    let chars = Array(s)
    let n = chars.count
    var dp = [Bool](repeating: false, count: n + 1)
    dp[0] = true
    for i in 1...n {
        for j in 0..<i where dp[j] && !dp[i] {
            let word = String(chars[j..<i])
            if wordDict.contains(word) {
                dp[i] = true
            }
        }
    }
    return dp[n]
}

let dict: Set<String> = ["swift", "is", "fun", "lang"]
print(wordBreak("swiftisfun", dict))
print(wordBreak("swiftlang", dict))
print(wordBreak("nope", dict))
