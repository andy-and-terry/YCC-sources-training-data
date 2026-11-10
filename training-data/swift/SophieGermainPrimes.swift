func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var i = 2
    while i * i <= n { if n % i == 0 { return false }; i += 1 }
    return true
}

var found: [Int] = []
var p = 2
while found.count < 10 {
    if isPrime(p) && isPrime(2 * p + 1) { found.append(p) }
    p += 1
}
print(found.map(String.init).joined(separator: " ")) // 2 3 5 11 23 29 41 53 83 89
