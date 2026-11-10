func pieces(_ cuts: Int) -> Int { (cuts * cuts + cuts + 2) / 2 }

print((0..<10).map { String(pieces($0)) }.joined(separator: " ")) // 1 2 4 7 11 16 22 29 37 46
