let words = ["apple", "avocado", "banana", "blueberry", "cherry", "apricot"]

let byFirstLetter = Dictionary(grouping: words, by: { $0.first! })
for key in byFirstLetter.keys.sorted() {
    print(key, byFirstLetter[key]!)
}

let lengthCounts = words.reduce(into: [Int: Int]()) { counts, word in
    counts[word.count, default: 0] += 1
}
print(lengthCounts.sorted { $0.key < $1.key })

let merged = ["a": 1, "b": 2].merging(["b": 10, "c": 3]) { old, new in old + new }
print(merged.sorted { $0.key < $1.key })

let doubled = merged.mapValues { $0 * 2 }
print(doubled.filter { $0.value > 4 }.keys.sorted())
