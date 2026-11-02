actor Counter {
    private var n = 0
    func inc() -> Int { n += 1; return n }
}
func demo() async {
    let c = Counter()
    _ = await c.inc()
    print(await c.inc())
}
