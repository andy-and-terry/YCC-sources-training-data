actor Counter {
    private var n = 0
    func bump() -> Int { n += 1; return n }
}

@main
struct Demo {
    static func main() async {
        let c = Counter()
        await withTaskGroup(of: Int.self) { g in
            for _ in 1...5 { g.addTask { await c.bump() } }
        }
        print(await c.bump())
    }
}
