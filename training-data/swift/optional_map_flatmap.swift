let text: String? = "42"

let number = text.map { Int($0) }          // Int??
let flat = text.flatMap { Int($0) }        // Int?
print(number as Any, flat as Any)

let doubled = flat.map { $0 * 2 }
print(doubled ?? 0)

let strings = ["1", "x", "3", "y", "5"]
print(strings.compactMap { Int($0) })

let nested = [[1, 2], [3], [], [4, 5]]
print(nested.flatMap { $0 })

if case let n? = flat, n > 40 {
    print("big", n)
}
