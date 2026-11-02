func allEqual<T: Collection>(_ c: T) -> Bool where T.Element: Equatable {
    guard let f = c.first else { return true }
    return c.allSatisfy { $0 == f }
}
print(allEqual([1, 1, 1]), allEqual("abc"))
