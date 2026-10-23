func kolakoski(_ count: Int) -> [Int] {
    var seq = [1, 2, 2]
    var i = 2
    while seq.count < count {
        let value = i % 2 == 0 ? 1 : 2
        seq.append(contentsOf: Array(repeating: value, count: seq[i]))
        i += 1
    }
    return Array(seq.prefix(count))
}

print(kolakoski(20).map(String.init).joined(separator: " "))
