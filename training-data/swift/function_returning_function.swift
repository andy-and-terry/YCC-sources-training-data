func makeAdder(_ n: Int) -> (Int) -> Int {
    { $0 + n }
}

func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}

func compose<A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
    { g(f($0)) }
}

let addTen = makeAdder(10)
let tick = makeCounter()
print(addTen(5))
print(tick(), tick(), tick())
let pipeline = compose(addTen, { "result: \($0)" })
print(pipeline(1))
