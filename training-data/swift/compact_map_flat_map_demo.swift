let raw = ["1", "two", "3", "", "5"]

print(raw.map { Int($0) })
print(raw.compactMap { Int($0) })
print(raw.compactMap(Int.init).reduce(0, +))

let nested = [[1, 2], [3], [], [4, 5, 6]]
print(nested.flatMap { $0 })
print(nested.joined().map { $0 * 2 })

let sentences = ["the quick fox", "jumps over"]
print(sentences.flatMap { $0.split(separator: " ") }.map(String.init))

let pairs = (1...3).flatMap { x in (x...3).map { y in (x, y) } }
print(pairs)

let optional: Int? = 4
print(optional.map { $0 * 2 } as Any)
print(optional.flatMap { $0 > 5 ? $0 : nil } as Any)

let dict = ["a": 1, "b": 2]
print(dict.compactMapValues { $0 > 1 ? $0 * 10 : nil })

struct Person { let name: String; let nickname: String? }
let people = [Person(name: "Ann", nickname: "A"), Person(name: "Bob", nickname: nil)]
print(people.compactMap(\.nickname))

let strings = ["10", "20", "x"]
let total = strings.compactMap { Int($0) }.reduce(0, +)
print(total)
print(strings.map { Int($0) ?? 0 })
print(strings.first(where: { Int($0) == nil }) ?? "none")
