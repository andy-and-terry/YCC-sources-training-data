func recaman(_ count: Int) -> [Int] {
    var seq = [0]
    var seen: Set<Int> = [0]
    for n in 1..<count {
        var next = seq[n - 1] - n
        if next <= 0 || seen.contains(next) {
            next = seq[n - 1] + n
        }
        seen.insert(next)
        seq.append(next)
    }
    return seq
}

print(recaman(20).map(String.init).joined(separator: " "))
