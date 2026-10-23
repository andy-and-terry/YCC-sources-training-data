func stern(_ count: Int) -> [Int] {
    var s = [0, 1]
    for n in 2..<count {
        s.append(n % 2 == 0 ? s[n / 2] : s[n / 2] + s[n / 2 + 1])
    }
    return Array(s.prefix(count))
}

print(stern(20).map(String.init).joined(separator: " "))
