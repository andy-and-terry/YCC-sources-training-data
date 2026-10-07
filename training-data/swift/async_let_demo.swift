func fetchNumber(_ n: Int, delayMs: UInt64) async -> Int {
    try? await Task.sleep(nanoseconds: delayMs * 1_000_000)
    return n * 10
}

func runAll() async {
    async let a = fetchNumber(1, delayMs: 30)
    async let b = fetchNumber(2, delayMs: 10)
    async let c = fetchNumber(3, delayMs: 20)

    let results = await [a, b, c]
    print(results)
    print("sum:", results.reduce(0, +))
}

@main
struct Main {
    static func main() async {
        await runAll()
    }
}
