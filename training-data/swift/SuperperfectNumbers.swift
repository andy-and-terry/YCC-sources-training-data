func sigma(_ n: Int) -> Int { (1...n).filter { n % $0 == 0 }.reduce(0, +) }

print((1..<100).filter { sigma(sigma($0)) == 2 * $0 }.map(String.init).joined(separator: " ")) // 2 4 16 64
