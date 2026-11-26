// Deficient numbers below 100; expect 76.
func properSum(_ n: Int) -> Int {
    (1..<n).filter { n % $0 == 0 }.reduce(0, +)
}
print((1..<100).filter { properSum($0) < $0 }.count)
