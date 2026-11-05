print(Array(stride(from: 0, to: 20, by: 5)))
print(Array(zip(1...3, "abc")))
let big = (1...).lazy.filter { $0 % 7 == 0 }.map { $0 * 2 }
print(Array(big.prefix(4)))
print(Dictionary(grouping: ["a", "bb", "cc", "d"], by: { $0.count }).sorted { $0.key < $1.key })
