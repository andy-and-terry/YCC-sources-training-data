// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
var r = 0
var out: [String] = []
for _ in 0..<8 {
    r = r * 10 + 1
    out.append(String(r))
}
print(out.joined(separator: " "))
