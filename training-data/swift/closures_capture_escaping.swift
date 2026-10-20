func makeCounter() -> () -> Int {
    var n = 0
    return { n += 1; return n }
}

let c1 = makeCounter(), c2 = makeCounter()
print(c1(), c1(), c2())

var handlers: [() -> String] = []
func register(_ h: @escaping () -> String) { handlers.append(h) }
for i in 1...3 { register { "handler \(i)" } }
print(handlers.map { $0() })

func apply(_ n: Int, _ f: (Int) -> Int) -> Int { f(n) }
print(apply(5) { $0 * $0 }, [3, 1, 2].sorted(by: >), [1, 2, 3].reduce(0, +))
class Owner {
    var value = 1
    lazy var inc: () -> Void = { [weak self] in self?.value += 1 }
}
let o = Owner(); o.inc(); print(o.value)
