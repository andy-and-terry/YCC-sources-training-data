func duval(_ str: String) -> [String] {
    let s = Array(str)
    var out: [String] = []
    var i = 0
    while i < s.count {
        var j = i + 1, k = i
        while j < s.count && s[k] <= s[j] {
            k = s[k] < s[j] ? i : k + 1
            j += 1
        }
        while i <= k {
            out.append(String(s[i..<(i + j - k)]))
            i += j - k
        }
    }
    return out
}
print(duval("banana"))
