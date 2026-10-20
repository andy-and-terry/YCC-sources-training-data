struct Fib: Sequence, IteratorProtocol {
    var a = 0, b = 1
    mutating func next() -> Int? { defer { (a, b) = (b, a + b) }; return a }
}
print(Array(Fib().prefix(10)))
print(Fib().lazy.filter { $0 % 2 == 0 }.prefix(5).map { $0 })

struct Countdown: Sequence {
    let from: Int
    func makeIterator() -> AnyIterator<Int> {
        var n = from
        return AnyIterator { guard n > 0 else { return nil }; defer { n -= 1 }; return n }
    }
}
print(Array(Countdown(from: 4)))
print(stride(from: 10, through: 0, by: -5).map { $0 }, Array(zip("ab", 1...)))
