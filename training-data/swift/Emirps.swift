func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var i = 2
    while i * i <= n { if n % i == 0 { return false }; i += 1 }
    return true
}

var out: [Int] = []
var n = 2
while out.count < 10 {
    let r = Int(String(String(n).reversed()))!
    if r != n && isPrime(n) && isPrime(r) { out.append(n) }
    n += 1
}
print(out.map(String.init).joined(separator: " ")) // 13 17 31 37 71 73 79 97 107 113
