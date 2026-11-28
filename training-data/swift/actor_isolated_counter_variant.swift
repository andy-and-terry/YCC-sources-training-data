actor Counter {
    private var value = 0
    func increment() -> Int { value += 1; return value }
}

let c = Counter()
Task {
    async let a = c.increment()
    async let b = c.increment()
    print(await a + b)
}
