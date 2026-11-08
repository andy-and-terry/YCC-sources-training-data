func square(_ n: Int) async -> Int { n * n }

func total() async -> Int {
    await withTaskGroup(of: Int.self) { group in
        for n in 1...5 { group.addTask { await square(n) } }
        var sum = 0
        for await v in group { sum += v }
        return sum
    }
}

Task { print(await total()) }
