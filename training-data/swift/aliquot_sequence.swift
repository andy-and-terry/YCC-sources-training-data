func properDivisorSum(_ n: Int) -> Int {
    guard n >= 2 else { return 0 }
    var sum = 0
    for d in 1...(n / 2) where n % d == 0 {
        sum += d
    }
    return sum
}

var n = 12
var seq = [n]
while n != 0 {
    n = properDivisorSum(n)
    seq.append(n)
}
print(seq.map(String.init).joined(separator: " "))
