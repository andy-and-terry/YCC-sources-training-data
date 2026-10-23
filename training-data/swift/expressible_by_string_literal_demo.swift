// Conforming to ExpressibleBy...Literal lets a type be built from a plain literal.
struct Email: ExpressibleByStringLiteral, CustomStringConvertible {
    let user: String
    let domain: String

    init(stringLiteral value: String) {
        let parts = value.split(separator: "@", maxSplits: 1).map(String.init)
        user = parts.first ?? ""
        domain = parts.count > 1 ? parts[1] : "unknown"
    }

    var description: String { "\(user) at \(domain)" }
}

struct Percent: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    let value: Double
    init(integerLiteral value: Int) { self.value = Double(value) }
    init(floatLiteral value: Double) { self.value = value }
}

struct Bag: ExpressibleByArrayLiteral {
    var counts: [String: Int] = [:]
    init(arrayLiteral elements: String...) {
        for e in elements { counts[e, default: 0] += 1 }
    }
}

let mail: Email = "ada@example.com"
print(mail)

let half: Percent = 50
let frac: Percent = 12.5
print(half.value, frac.value)

let bag: Bag = ["a", "b", "a", "c", "a"]
print(bag.counts.sorted { $0.key < $1.key })
