let raw = ["1", "two", "3", "4x", "5"]

let numbers = raw.compactMap { Int($0) }
print(numbers)

let nested = [[1, 2], [3], [], [4, 5, 6]]
print(nested.flatMap { $0 })

let pairs = [1, 2, 3].flatMap { a in ["a", "b"].map { b in "\(a)\(b)" } }
print(pairs)

let maybe: Int? = 5
print(maybe.map { $0 * 2 } as Any)
print(maybe.flatMap { $0 > 10 ? $0 : nil } as Any)

print(numbers.filter { $0.isMultiple(of: 2) }.reduce(0, +))
