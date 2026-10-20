func largest<T: Comparable>(_ xs: [T]) -> T? {
    guard var best = xs.first else { return nil }
    for x in xs where x > best { best = x }
    return best
}

struct Stack<Element> {
    private var items: [Element] = []
    mutating func push(_ x: Element) { items.append(x) }
    mutating func pop() -> Element? { items.popLast() }
    var top: Element? { items.last }
}

extension Stack where Element: Equatable {
    func contains(_ x: Element) -> Bool { items.contains(x) }
}

func allEqual<C: Collection>(_ c: C) -> Bool where C.Element: Equatable {
    guard let f = c.first else { return true }
    return c.allSatisfy { $0 == f }
}

var s = Stack<Int>()
s.push(1); s.push(2)
print(largest([3, 9, 2]) ?? 0, s.top ?? -1, s.contains(1), allEqual([1, 1, 1]))
