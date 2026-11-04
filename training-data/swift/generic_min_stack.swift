struct MinStack<T: Comparable> {
    private var items: [(value: T, min: T)] = []

    mutating func push(_ v: T) {
        let m = items.last.map { Swift.min($0.min, v) } ?? v
        items.append((v, m))
    }

    mutating func pop() -> T? { items.popLast()?.value }

    var min: T? { items.last?.min }
}

var s = MinStack<Int>()
[5, 3, 7, 2].forEach { s.push($0) }
print(s.min!)
_ = s.pop()
print(s.min!)
