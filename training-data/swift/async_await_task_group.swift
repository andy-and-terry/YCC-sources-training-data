func square(_ n: Int) async -> Int { n * n }

@main
struct App {
    static func main() async {
        let total = await withTaskGroup(of: Int.self) { g in
            for i in 1...4 { g.addTask { await square(i) } }
            return await g.reduce(0, +)
        }
        print(total)
    }
}
