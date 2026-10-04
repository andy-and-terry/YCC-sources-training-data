let words = ["apple", "avocado", "banana", "blueberry", "cherry", "apricot", "cranberry"]

let grouped = Dictionary(grouping: words, by: { $0.first! })

for key in grouped.keys.sorted() {
    print("\(key): \(grouped[key]!.sorted())")
}

var counts: [Character: Int] = [:]
for word in words {
    counts[word.first!, default: 0] += 1
}
print(counts.sorted { $0.key < $1.key })

let lengths = Dictionary(uniqueKeysWithValues: words.map { ($0, $0.count) })
print(lengths["banana"] ?? 0)
