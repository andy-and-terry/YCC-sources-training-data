let numbers = Array(1...10)

let squares = numbers.map { $0 * $0 }
let evens = numbers.filter { $0.isMultiple(of: 2) }
let total = numbers.reduce(0, +)
let words = ["1", "two", "3"].compactMap { Int($0) }
let nested = [[1, 2], [3], [4, 5]].flatMap { $0 }

print(squares)
print(evens)
print(total)
print(words)
print(nested)

let grouped = Dictionary(grouping: numbers) { $0 % 3 }
for key in grouped.keys.sorted() {
    print(key, grouped[key]!)
}

func compose<A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
    { g(f($0)) }
}

let addThenDouble = compose({ (x: Int) in x + 1 }, { $0 * 2 })
print(addThenDouble(4))

print(numbers.first(where: { $0 > 6 }) as Any)
print(numbers.allSatisfy { $0 > 0 }, numbers.contains { $0 > 10 })
