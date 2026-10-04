struct Counter {
    private(set) var count = 0
    private(set) var history: [Int] = []

    mutating func increment(by amount: Int = 1) {
        history.append(count)
        count += amount
    }

    mutating func reset() {
        self = Counter()
    }

    func incremented() -> Counter {
        var copy = self
        copy.increment()
        return copy
    }
}

var c = Counter()
c.increment()
c.increment(by: 5)
print(c.count, c.history)

let d = c.incremented()
print(d.count, c.count)

c.reset()
print(c.count, c.history.isEmpty)
