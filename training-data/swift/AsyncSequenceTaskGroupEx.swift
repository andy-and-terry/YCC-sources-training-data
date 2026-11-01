func square(_ n: Int) async -> Int { n * n }

let results = await withTaskGroup(of: Int.self) { group -> [Int] in
    for i in 1...4 { group.addTask { await square(i) } }
    var out: [Int] = []
    for await r in group { out.append(r) }
    return out.sorted()
}
print(results)
