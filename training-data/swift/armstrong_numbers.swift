import Foundation

func isArmstrong(_ n: Int) -> Bool {
    let digits = String(n).compactMap { $0.wholeNumberValue }
    let total = digits.reduce(0) { $0 + Int(pow(Double($1), Double(digits.count))) }
    return total == n
}

print((1..<1000).filter(isArmstrong)) // [1, ..., 9, 153, 370, 371, 407]
