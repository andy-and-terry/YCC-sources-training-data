func hofstadterQ(_ count: Int) -> [Int] {
    var q = [0, 1, 1]
    for n in 3...count {
        q.append(q[n - q[n - 1]] + q[n - q[n - 2]])
    }
    return Array(q.dropFirst())
}

print(hofstadterQ(20).map(String.init).joined(separator: " "))
