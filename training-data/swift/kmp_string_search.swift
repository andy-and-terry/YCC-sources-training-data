func buildFailureTable(_ pattern: [Character]) -> [Int] {
    var fail = [Int](repeating: 0, count: pattern.count)
    var k = 0
    for i in 1..<pattern.count {
        while k > 0 && pattern[k] != pattern[i] { k = fail[k - 1] }
        if pattern[k] == pattern[i] { k += 1 }
        fail[i] = k
    }
    return fail
}

func kmpSearch(_ text: String, _ pattern: String) -> [Int] {
    let t = Array(text), p = Array(pattern)
    guard !p.isEmpty else { return [] }
    let fail = buildFailureTable(p)
    var matches: [Int] = []
    var k = 0
    for i in 0..<t.count {
        while k > 0 && p[k] != t[i] { k = fail[k - 1] }
        if p[k] == t[i] { k += 1 }
        if k == p.count {
            matches.append(i - k + 1)
            k = fail[k - 1]
        }
    }
    return matches
}

print(kmpSearch("ababcababcabc", "abc"))
