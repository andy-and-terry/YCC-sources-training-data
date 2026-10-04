func classify(_ point: (Int, Int)) -> String {
    switch point {
    case (0, 0):
        return "origin"
    case (let x, 0):
        return "on x-axis at \(x)"
    case (0, let y):
        return "on y-axis at \(y)"
    case (let x, let y) where x == y:
        return "diagonal at \(x)"
    case (-3...3, -3...3):
        return "near origin"
    default:
        return "far away"
    }
}

for p in [(0, 0), (4, 0), (0, -2), (5, 5), (1, 2), (10, 3)] {
    print(p, classify(p))
}

func fizzbuzz(_ n: Int) -> String {
    switch (n % 3, n % 5) {
    case (0, 0): return "FizzBuzz"
    case (0, _): return "Fizz"
    case (_, 0): return "Buzz"
    default: return String(n)
    }
}
print((1...15).map(fizzbuzz).joined(separator: " "))

let person = (name: "Ann", age: 31, city: "Oslo")
let (name, age, _) = person
print(name, age, person.city)

var (a, b) = (1, 2)
(a, b) = (b, a)
print(a, b)

func minMax(_ xs: [Int]) -> (min: Int, max: Int)? {
    guard let first = xs.first else { return nil }
    return xs.reduce((first, first)) { (min($0.0, $1), max($0.1, $1)) }
}
if let result = minMax([4, 9, 1, 7]) {
    print(result.min, result.max)
}

let result: (Int, String?) = (404, nil)
switch result {
case (200..<300, _): print("ok")
case (let code, nil): print("error \(code) without message")
case (let code, let message?): print("error \(code): \(message)")
default: break
}
