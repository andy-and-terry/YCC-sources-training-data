actor Counter {
    private var value = 0
    func increment() -> Int {
        value += 1
        return value
    }
}

let counter = Counter()
Task {
    async let a = counter.increment()
    async let b = counter.increment()
    print(await a + b)
}
