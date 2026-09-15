func rabinKarpSearch(_ text: String, _ pattern: String) -> [Int] {
    let t = Array(text)
    let p = Array(pattern)
    let n = t.count, m = p.count
    guard m > 0, m <= n else { return [] }

    let base = 256
    let prime = 1_000_000_007
    var h = 1
    for _ in 0..<(m - 1) { h = (h * base) % prime }

    var patternHash = 0
    var windowHash = 0
    for i in 0..<m {
        patternHash = (patternHash * base + Int(p[i].asciiValue ?? 0)) % prime
        windowHash = (windowHash * base + Int(t[i].asciiValue ?? 0)) % prime
    }

    var matches: [Int] = []
    var i = 0
    while true {
        if windowHash == patternHash && Array(t[i..<(i + m)]) == p {
            matches.append(i)
        }
        if i == n - m { break }

        let oldChar = Int(t[i].asciiValue ?? 0)
        let newChar = Int(t[i + m].asciiValue ?? 0)
        windowHash = (base * (windowHash - oldChar * h) + newChar) % prime
        if windowHash < 0 { windowHash += prime }
        i += 1
    }

    return matches
}

print(rabinKarpSearch("ababcababcabc", "abc"))
print(rabinKarpSearch("aaaaaa", "aa"))
print(rabinKarpSearch("hello", "xyz"))
