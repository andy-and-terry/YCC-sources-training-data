struct Counter {
    private(set) var count = 0

    mutating func increment(by amount: Int = 1) {
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

struct Vector2 {
    var x: Double
    var y: Double

    mutating func scale(by factor: Double) {
        x *= factor
        y *= factor
    }

    mutating func normalize() {
        let length = (x * x + y * y).squareRoot()
        guard length > 0 else { return }
        x /= length
        y /= length
    }
}

var c = Counter()
c.increment()
c.increment(by: 5)
print(c.count)
let next = c.incremented()
print(c.count, next.count)
c.reset()
print(c.count)

var v = Vector2(x: 3, y: 4)
v.scale(by: 2)
print(v)
v.normalize()
print(v)

let frozen = Vector2(x: 1, y: 1)
// frozen.scale(by: 2)  // error: cannot mutate a let constant
print(frozen)

var list = [Counter(), Counter()]
list[0].increment(by: 3)
for i in list.indices { list[i].increment() }
print(list.map(\.count))
