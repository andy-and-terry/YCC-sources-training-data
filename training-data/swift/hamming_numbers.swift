// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
func isHamming(_ start: Int) -> Bool {
    var n = start
    for p in [2, 3, 5] {
        while n % p == 0 { n /= p }
    }
    return n == 1
}

var found: [Int] = []
var n = 1
while found.count < 20 {
    if isHamming(n) { found.append(n) }
    n += 1
}
print(found.map(String.init).joined(separator: " "))
