func ulam(_ count: Int) -> [Int] {
    var seq = [1, 2]
    var n = 3
    while seq.count < count {
        let candidate = n
        let ways = seq.filter { candidate - $0 > $0 && seq.contains(candidate - $0) }.count
        if ways == 1 {
            seq.append(candidate)
        }
        n += 1
    }
    return seq
}

print(ulam(15).map(String.init).joined(separator: " "))
