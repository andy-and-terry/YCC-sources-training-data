func tau(_ n: Int) -> Int { (1...n).filter { n % $0 == 0 }.count }

print((1..<60).filter { $0 % tau($0) == 0 }.map(String.init).joined(separator: " ")) // 1 2 8 9 12 18 24 36 40 56
