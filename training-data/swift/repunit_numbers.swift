// Repunits: numbers made only of the digit 1.
var r = 0
var out: [Int] = []
for _ in 0..<5 {
    r = r * 10 + 1
    out.append(r)
}
print(out)
