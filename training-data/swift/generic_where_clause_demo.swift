func commonElements<C1: Collection, C2: Collection>(_ first: C1, _ second: C2) -> [C1.Element]
    where C1.Element: Equatable, C1.Element == C2.Element {
    first.filter { second.contains($0) }
}

print(commonElements([1, 2, 3, 4], [3, 4, 5, 6]))
print(commonElements(["a", "b", "c"], ["b", "c", "d"]))

struct Pair<A, B> {
    let first: A
    let second: B
}

extension Pair: Equatable where A: Equatable, B: Equatable {
    static func == (lhs: Pair, rhs: Pair) -> Bool {
        lhs.first == rhs.first && lhs.second == rhs.second
    }
}

let p1 = Pair(first: 1, second: "x")
let p2 = Pair(first: 1, second: "x")
print(p1 == p2)

extension Sequence where Element: Numeric {
    func sum() -> Element {
        reduce(0, +)
    }
}

print([1, 2, 3, 4].sum())
print([1.5, 2.5, 3.0].sum())
