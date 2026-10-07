struct Message: ExpressibleByStringInterpolation, CustomStringConvertible {
    var description: String

    init(stringLiteral value: String) {
        description = value
    }

    init(stringInterpolation: StringInterpolation) {
        description = stringInterpolation.output
    }

    struct StringInterpolation: StringInterpolationProtocol {
        var output = ""

        init(literalCapacity: Int, interpolationCount: Int) {
            output.reserveCapacity(literalCapacity)
        }

        mutating func appendLiteral(_ literal: String) {
            output += literal
        }

        mutating func appendInterpolation(upper value: String) {
            output += value.uppercased()
        }

        mutating func appendInterpolation(_ value: Double, decimals: Int) {
            output += String(format: "%.\(decimals)f", value)
        }
    }
}

let name = "swift"
let msg: Message = "Hello \(upper: name), pi is \(3.14159, decimals: 2)"
print(msg)
