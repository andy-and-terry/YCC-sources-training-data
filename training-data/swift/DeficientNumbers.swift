func sigma(_ n: Int) -> Int {
    (1...n).filter { n % $0 == 0 }.reduce(0, +)
}

print((1...20).filter { sigma($0) < 2 * $0 })
