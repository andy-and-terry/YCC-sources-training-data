func largest<T: Comparable>(_ items: [T]) -> T? {
    guard var best = items.first else { return nil }
    for item in items where item > best { best = item }
    return best
}

print(largest([3, 9, 2]) ?? 0)
print(largest(["pear", "apple", "zebra"]) ?? "")
print(largest([Double]()) as Any)

func allEqual<C: Collection>(_ c: C) -> Bool where C.Element: Equatable {
    guard let f = c.first else { return true }
    return c.allSatisfy { $0 == f }
}
print(allEqual([1, 1, 1]), allEqual("abc"))
