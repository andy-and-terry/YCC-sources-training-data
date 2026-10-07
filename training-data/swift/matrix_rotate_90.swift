func rotateClockwise<T>(_ m: [[T]]) -> [[T]] {
    guard let first = m.first else { return [] }
    return first.indices.map { c in m.reversed().map { $0[c] } }
}

let rotated = rotateClockwise([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
rotated.forEach { print($0) }
