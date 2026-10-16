struct Counter {
    private(set) var value = 0

    @discardableResult
    mutating func increment() -> Int {
        value += 1
        return value
    }
}

var counter = Counter()
counter.increment()
counter.increment()
let latest = counter.increment()
print(latest)
print(counter.value)
