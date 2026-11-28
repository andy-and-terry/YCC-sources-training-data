import Foundation

func isPronic(_ x: Int) -> Bool {
    let n = Int(Double(x).squareRoot())
    return n * (n + 1) == x
}

print((0..<10).map { $0 * ($0 + 1) }) // [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
print(isPronic(56), isPronic(57)) // true false
