let big = (1...1_000_000).lazy
    .filter { $0 % 7 == 0 }
    .map { $0 * 2 }
print(Array(big.prefix(5)))
