func farey(_ n: Int) -> [String] {
    var terms = ["0/1"]
    var (a, b, c, d) = (0, 1, 1, n)
    while c <= n {
        terms.append("\(c)/\(d)")
        let k = (n + b) / d
        (a, b, c, d) = (c, d, k * c - a, k * d - b)
    }
    return terms
}

print(farey(5).joined(separator: " "))
