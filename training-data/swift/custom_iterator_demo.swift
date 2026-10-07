struct Fibonacci: Sequence, IteratorProtocol {
    var current = 0
    var nextValue = 1
    let limit: Int

    mutating func next() -> Int? {
        guard current <= limit else { return nil }
        let result = current
        let newNext = current + nextValue
        current = nextValue
        nextValue = newNext
        return result
    }
}

let fib = Fibonacci(limit: 50)
print(Array(fib))

for value in Fibonacci(limit: 20) {
    print(value, terminator: " ")
}
print()
