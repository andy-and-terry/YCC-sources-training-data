let names = ["Alice", "Adam", "Bob", "Beth", "Carl", "Anna"]

let byInitial = Dictionary(grouping: names, by: { $0.first! })
for key in byInitial.keys.sorted() {
    print(key, byInitial[key]!)
}

var counts: [Character: Int] = [:]
for ch in "mississippi" {
    counts[ch, default: 0] += 1
}
print(counts.sorted { $0.key < $1.key })

let merged = ["a": 1, "b": 2].merging(["b": 3, "c": 4]) { old, new in old + new }
print(merged.sorted { $0.key < $1.key })

let lengths = Dictionary(uniqueKeysWithValues: names.map { ($0, $0.count) })
print(lengths["Alice"] ?? 0)
print(lengths.filter { $0.value == 4 }.keys.sorted())
print(lengths.mapValues { $0 * 2 }["Bob"]!)
