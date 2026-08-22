func wordFrequency(_ text: String) -> [(String, Int)] {
    let words = text.lowercased().split(separator: " ").map(String.init)
    var counts: [String: Int] = [:]
    for word in words { counts[word, default: 0] += 1 }
    return counts.sorted { $0.value > $1.value }.map { ($0.key, $0.value) }
}

let text = "the quick brown fox jumps over the lazy dog the fox runs"
for (word, count) in wordFrequency(text) {
    print("\(word): \(count)")
}
