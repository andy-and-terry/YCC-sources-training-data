func stern(_ count: Int) -> [Int] {
    var seq = [0, 1]
    while seq.count < count {
        let i = seq.count
        seq.append(i % 2 == 0 ? seq[i / 2] : seq[i / 2] + seq[i / 2 + 1])
    }
    return Array(seq.prefix(count))
}

print(stern(15)) // [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
