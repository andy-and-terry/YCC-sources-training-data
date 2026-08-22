func fetchValue(_ value: Int, delay: UInt64) async -> Int {
    try? await Task.sleep(nanoseconds: delay)
    return value
}

func main() async {
    async let a = fetchValue(1, delay: 10_000_000)
    async let b = fetchValue(2, delay: 5_000_000)
    async let c = fetchValue(3, delay: 1_000_000)
    let results = await [a, b, c]
    print(results)
}

Task {
    await main()
}
