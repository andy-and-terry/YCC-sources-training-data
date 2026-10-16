actor Tally {
    private var counts: [String: Int] = [:]

    func record(_ key: String) {
        counts[key, default: 0] += 1
    }

    func snapshot() -> [String: Int] {
        counts
    }
}

func run() async {
    let tally = Tally()
    await withTaskGroup(of: Void.self) { group in
        for word in ["a", "b", "a", "c", "a", "b"] {
            group.addTask { await tally.record(word) }
        }
    }
    let result = await tally.snapshot()
    for key in result.keys.sorted() {
        print(key, result[key]!)
    }
}

await run()
