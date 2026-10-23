// Pell numbers: P(0) = 0, P(1) = 1, P(n) = 2*P(n-1) + P(n-2).
var p = [0, 1]
for n in 2..<15 {
    p.append(2 * p[n - 1] + p[n - 2])
}
print(p.map(String.init).joined(separator: " "))
