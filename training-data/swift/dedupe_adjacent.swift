// Remove consecutive duplicates with reduce.
extension Array where Element: Equatable {
    func dedupe() -> [Element] {
        reduce(into: [Element]()) { acc, x in if acc.last != x { acc.append(x) } }
    }
}
print(String("aabbbcdd".dedupe()))
