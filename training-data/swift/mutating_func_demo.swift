struct Counter {
    private(set) var value = 0

    mutating func increment(by amount: Int = 1) {
        value += amount
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
print(c.value)

let d = c.incremented()
print(c.value, d.value)

c.reset()
print(c.value)
