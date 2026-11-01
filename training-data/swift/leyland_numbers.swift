import Foundation

// Leyland numbers: x^y + y^x for x >= y >= 2.
func ipow(_ b: Int, _ e: Int) -> Int {
    (0..<e).reduce(1) { acc, _ in acc * b }
}

var vals: [String] = []
for x in 2...4 {
    for y in 2...x {
        vals.append(String(ipow(x, y) + ipow(y, x)))
    }
}
print(vals.joined(separator: " "))
