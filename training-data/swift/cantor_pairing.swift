import Foundation

// Cantor pairing function and its inverse.
func pair(_ x: Int, _ y: Int) -> Int { (x + y) * (x + y + 1) / 2 + y }

func unpair(_ z: Int) -> (Int, Int) {
    let w = Int((sqrt(Double(8 * z + 1)) - 1) / 2)
    let y = z - w * (w + 1) / 2
    return (w - y, y)
}

print(pair(3, 4))
let (x, y) = unpair(32)
print(x, y)
