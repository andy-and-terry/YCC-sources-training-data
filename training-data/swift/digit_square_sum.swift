func digitSquareSum(_ n: Int) -> Int {
    String(abs(n)).compactMap { $0.wholeNumberValue }.reduce(0) { $0 + $1 * $1 }
}

print(digitSquareSum(123))
print(digitSquareSum(-99))
