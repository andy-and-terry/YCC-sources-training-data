import Foundation

// n is triangular iff 8n + 1 is a perfect square.
func isTriangular(_ n: Int) -> Bool {
    let s = 8 * n + 1
    let r = Int(Double(s).squareRoot().rounded())
    return r * r == s
}

print((0...20).filter(isTriangular).map(String.init).joined(separator: " "))
