let words = ["apple", "avocado", "banana", "blueberry", "cherry", "apricot"]

var counts: [Character: Int] = [:]
for word in words {
    counts[word.first!, default: 0] += 1
}
for key in counts.keys.sorted() {
    print(key, counts[key]!)
}

let grouped = Dictionary(grouping: words, by: { $0.first! })
for key in grouped.keys.sorted() {
    print(key, grouped[key]!)
}

let lengths = Dictionary(uniqueKeysWithValues: words.map { ($0, $0.count) })
print(lengths["banana"] ?? 0)

let merged = lengths.merging(["banana": 100, "date": 4]) { _, new in new }
print(merged["banana"]!, merged["date"]!, merged.count)

var inventory = ["apples": 3, "pears": 0]
inventory["pears"] = nil
inventory["kiwis", default: 0] += 5
print(inventory.sorted { $0.key < $1.key })

let doubled = inventory.mapValues { $0 * 2 }
print(doubled["apples"]!)

let filtered = lengths.filter { $0.value > 6 }
print(filtered.keys.sorted())

var cache: [Int: Int] = [:]
func square(_ n: Int) -> Int {
    if let hit = cache[n] { return hit }
    let result = n * n
    cache[n] = result
    return result
}
print(square(12), square(12), cache.count)
print(inventory.removeValue(forKey: "apples") ?? -1, inventory.isEmpty)
