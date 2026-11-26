// Primorials up to 1e6, including 1; expect 8.
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var d = 2
    while d * d <= n {
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

var values = [1]
var acc = 1
var p = 2
while true {
    if isPrime(p) {
        acc *= p
        if acc > 1_000_000 { break }
        values.append(acc)
    }
    p += 1
}
print(values.count, values)
