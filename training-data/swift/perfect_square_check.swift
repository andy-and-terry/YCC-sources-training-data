import Foundation

func isPerfectSquare(_ n: Int) -> Bool {
    guard n >= 0 else { return false }
    let r = Int(Double(n).squareRoot())
    return r * r == n
}

print((0..<30).filter(isPerfectSquare))
