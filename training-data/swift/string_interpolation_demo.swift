import Foundation

struct Temperature {
    var celsius: Double
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ t: Temperature) {
        appendLiteral(String(format: "%.1f°C", t.celsius))
    }

    mutating func appendInterpolation(_ value: Int, padded width: Int) {
        let text = String(value)
        appendLiteral(String(repeating: " ", count: max(0, width - text.count)) + text)
    }
}

let t = Temperature(celsius: 21.456)
print("Now: \(t)")
print("[\(7, padded: 4)]")
print("[\(1234, padded: 4)]")

let name = "Swift"
print("Hello, \(name.uppercased()) — \(name.count) letters")

let multiline = """
    Report
      total: \(3 + 4)
    done
    """
print(multiline)
print(#"Raw \n stays, but \#(name) interpolates"#)
