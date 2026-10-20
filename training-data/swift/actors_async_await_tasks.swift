actor Counter {
    private var value = 0
    func increment() -> Int { value += 1; return value }
}

func fetch(_ n: Int) async -> Int {
    try? await Task.sleep(nanoseconds: 10_000_000)
    return n * n
}

@main
struct Demo {
    static func main() async {
        let c = Counter()
        await withTaskGroup(of: Int.self) { g in
            for _ in 1...5 { g.addTask { await c.increment() } }
        }
        print(await c.increment())
        async let a = fetch(2), b = fetch(3)
        print(await a + b)
        let t = Task { await fetch(4) }
        print(await t.value)
    }
}
