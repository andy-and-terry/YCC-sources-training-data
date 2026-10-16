let text = "the rain in spain stays mainly in the plain"
let words = text.split(separator: " ").map(String.init)

let counts = words.reduce(into: [String: Int]()) { acc, w in
    acc[w, default: 0] += 1
}

for (word, n) in counts.sorted(by: { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value }) {
    print("\(word): \(n)")
}

let byLength = words.reduce(into: [Int: [String]]()) { acc, w in
    acc[w.count, default: []].append(w)
}
print(byLength[2] ?? [])
