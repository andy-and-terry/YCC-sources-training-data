actor Counter {
    private var value = 0
    func increment() -> Int { value += 1; return value }
}

let c = Counter()
Task {
    for _ in 0..<3 { print(await c.increment()) }
}
