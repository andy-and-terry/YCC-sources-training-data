func longestPalindromicSubstring(_ s: String) -> String {
    let chars = Array(s)
    guard !chars.isEmpty else { return "" }

    var start = 0
    var end = 0

    func expand(_ left: Int, _ right: Int) -> (Int, Int) {
        var l = left
        var r = right
        while l >= 0 && r < chars.count && chars[l] == chars[r] {
            l -= 1
            r += 1
        }
        return (l + 1, r - 1)
    }

    for i in 0..<chars.count {
        let (oddStart, oddEnd) = expand(i, i)
        if oddEnd - oddStart > end - start {
            start = oddStart
            end = oddEnd
        }
        let (evenStart, evenEnd) = expand(i, i + 1)
        if evenEnd - evenStart > end - start {
            start = evenStart
            end = evenEnd
        }
    }

    return String(chars[start...end])
}

print(longestPalindromicSubstring("babad"))
print(longestPalindromicSubstring("cbbd"))
print(longestPalindromicSubstring("racecar"))
