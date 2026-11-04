func interleave(_ parts: String...) -> String {
    let chars = parts.map(Array.init)
    let longest = chars.map(\.count).max() ?? 0
    var out = ""
    for i in 0..<longest {
        for p in chars where i < p.count { out.append(p[i]) }
    }
    return out
}

print(interleave("abc", "12345"))
print(interleave("ab", "cd", "efg"))
