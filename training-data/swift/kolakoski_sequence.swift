func kolakoski(_ count: Int) -> [Int] {
    var seq = [1, 2, 2]
    var i = 2
    while seq.count < count {
        let value = 3 - seq[seq.count - 1]
        let run = seq[i]
        seq.append(contentsOf: Array(repeating: value, count: run))
        i += 1
    }
    return Array(seq.prefix(count))
}

print(kolakoski(20).map(String.init).joined(separator: " "))
