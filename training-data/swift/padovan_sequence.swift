// Padovan sequence: P(n) = P(n-2) + P(n-3), with P(0) = P(1) = P(2) = 1.
var p = [1, 1, 1]
for n in 3..<15 {
    p.append(p[n - 2] + p[n - 3])
}
print(p.map(String.init).joined(separator: " "))
