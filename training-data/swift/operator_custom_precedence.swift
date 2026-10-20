import Foundation

infix operator **: MultiplicationPrecedence
func ** (base: Double, exp: Double) -> Double { pow(base, exp) }

struct V2: Equatable { var x, y: Double }
extension V2 {
    static func + (a: V2, b: V2) -> V2 { V2(x: a.x + b.x, y: a.y + b.y) }
    static prefix func - (a: V2) -> V2 { V2(x: -a.x, y: -a.y) }
    static func * (k: Double, a: V2) -> V2 { V2(x: k * a.x, y: k * a.y) }
    static func += (a: inout V2, b: V2) { a = a + b }
}
var v = V2(x: 1, y: 2)
v += 2 * V2(x: 1, y: 1)
print(v, -v, 2 ** 10)
