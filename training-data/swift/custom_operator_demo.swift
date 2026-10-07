struct Vector2D {
    var x: Double
    var y: Double

    static func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        Vector2D(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    static func - (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        Vector2D(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    static func * (lhs: Vector2D, scalar: Double) -> Vector2D {
        Vector2D(x: lhs.x * scalar, y: lhs.y * scalar)
    }

    static prefix func - (vector: Vector2D) -> Vector2D {
        Vector2D(x: -vector.x, y: -vector.y)
    }
}

extension Vector2D: Equatable {}

extension Vector2D: CustomStringConvertible {
    var description: String { "(\(x), \(y))" }
}

let a = Vector2D(x: 1, y: 2)
let b = Vector2D(x: 3, y: 4)

print(a + b)
print(a - b)
print(a * 2.5)
print(-a)
print(a == Vector2D(x: 1, y: 2))

infix operator **: MultiplicationPrecedence

func ** (base: Double, exponent: Int) -> Double {
    var result = 1.0
    for _ in 0..<exponent {
        result *= base
    }
    return result
}

print(2.0 ** 10)

infix operator <>: AdditionPrecedence

func <> (lhs: String, rhs: String) -> String {
    "\(lhs)-\(rhs)"
}

print("left" <> "right")
