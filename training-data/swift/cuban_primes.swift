func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var i = 2
    while i * i <= n { if n % i == 0 { return false }; i += 1 }
    return true
}

var found: [Int] = []
var y = 1
while found.count < 8 {
    let p = 3 * y * y + 3 * y + 1
    if isPrime(p) { found.append(p) }
    y += 1
}
print(found)
