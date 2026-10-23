// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
// Int is 64-bit and traps on overflow, so stop after s(6).
var s = 2
for i in 0..<7 {
    print("s(\(i)) = \(s)")
    if i < 6 { s = s * s - s + 1 }
}
