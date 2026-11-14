func allEqual<C: Collection>(_ c: C) -> Bool where C.Element: Equatable {
    guard let f = c.first else { return true }
    return c.allSatisfy { $0 == f }
}

print(allEqual([1, 1, 1]), allEqual(["a", "b"]))
