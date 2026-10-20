struct PointS { var x = 0 }
final class PointC { var x = 0 }

var a = PointS(); var b = a; b.x = 5
let c = PointC(); let d = c; d.x = 5
print(a.x, b.x, c.x, d.x, c === d)

struct Counter {
    private(set) var count = 0
    mutating func increment() { count += 1 }
}
var ctr = Counter(); ctr.increment(); ctr.increment()
print(ctr.count)
class Base { func hi() -> String { "base" } }
class Derived: Base { override func hi() -> String { "derived+" + super.hi() } }
print(Derived().hi())
