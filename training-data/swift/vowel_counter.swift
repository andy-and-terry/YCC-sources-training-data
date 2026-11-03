func countVowels(_ s: String) -> [Character: Int] {
    var counts: [Character: Int] = [:]
    for c in s.lowercased() where "aeiou".contains(c) {
        counts[c, default: 0] += 1
    }
    return counts
}

for (k, v) in countVowels("Education is beautiful").sorted(by: { $0.key < $1.key }) {
    print("\(k)=\(v)", terminator: " ")
}
print()
