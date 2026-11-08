func encode(_ xs: [Int]) -> [Int] {
    xs.enumerated().map { $0.offset == 0 ? $0.element : $0.element - xs[$0.offset - 1] }
}

func decode(_ ds: [Int]) -> [Int] {
    var acc = 0
    return ds.map { acc += $0; return acc }
}

let d = encode([10, 12, 15, 15, 20])
print(d, decode(d))
