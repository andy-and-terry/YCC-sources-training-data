struct Celsius: ExpressibleByFloatLiteral, CustomStringConvertible {
    let degrees: Double

    init(floatLiteral value: Double) {
        degrees = value
    }

    var description: String { "\(degrees)°C" }
}

struct Tags: ExpressibleByArrayLiteral {
    let items: [String]

    init(arrayLiteral elements: String...) {
        items = elements.sorted()
    }
}

let temp: Celsius = 21.5
let tags: Tags = ["swift", "code", "demo"]
print(temp)
print(tags.items)
