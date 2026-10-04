let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

print(numbers.map { $0 * $0 })
print(numbers.filter { $0 % 2 == 0 })
print(numbers.reduce(0, +))
print(numbers.reduce(into: [String]()) { acc, n in
    if n % 3 == 0 { acc.append("fizz\(n)") }
})
print(numbers.compactMap { $0 > 5 ? String($0) : nil })
print([[1, 2], [3], [4, 5]].flatMap { $0 })
print(numbers.first(where: { $0 > 6 }) ?? -1)
print(numbers.allSatisfy { $0 > 0 }, numbers.contains(11))
print(numbers.sorted(by: >).prefix(3))
print(zip(numbers, numbers.dropFirst()).map { $1 - $0 }.allSatisfy { $0 == 1 })

func compose<A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
    { g(f($0)) }
}
let addOneThenDouble = compose({ (x: Int) in x + 1 }, { $0 * 2 })
print(addOneThenDouble(4))
