func ulam(_ count: Int) -> [Int] {
    var seq = [1, 2]
    var candidate = 3
    while seq.count < count {
        var ways = 0
        for i in 0..<seq.count {
            for j in (i + 1)..<seq.count where seq[i] + seq[j] == candidate {
                ways += 1
            }
        }
        if ways == 1 {
            seq.append(candidate)
        }
        candidate += 1
    }
    return seq
}

print(ulam(15).map(String.init).joined(separator: " "))
