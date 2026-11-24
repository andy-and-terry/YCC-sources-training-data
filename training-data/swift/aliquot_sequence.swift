// Aliquot sequence: replace n by the sum of its proper divisors.
func aliquotSum(_ n: Int) -> Int {
    (1...max(1, n / 2)).filter { n % $0 == 0 && $0 < n }.reduce(0, +)
}

var seq = [12]
while seq.last! > 1 && seq.count < 20 {
    seq.append(aliquotSum(seq.last!))
}
print(seq.map(String.init).joined(separator: " "))
