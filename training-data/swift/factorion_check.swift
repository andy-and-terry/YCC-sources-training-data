let fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

func isFactorion(_ n: Int) -> Bool {
    n == String(n).compactMap { $0.wholeNumberValue }.map { fact[$0] }.reduce(0, +)
}

print((1..<50000).filter(isFactorion))
