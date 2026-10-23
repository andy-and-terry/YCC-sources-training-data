func digitSum(_ n: Int) -> Int {
    String(n).reduce(0) { $0 + Int(String($1))! }
}

func isSmith(_ n: Int) -> Bool {
    var m = n
    var sum = 0
    var p = 2
    while p * p <= m {
        while m % p == 0 {
            sum += digitSum(p)
            m /= p
        }
        p += 1
    }
    if m == n { return false } // prime
    if m > 1 { sum += digitSum(m) }
    return sum == digitSum(n)
}

print((2..<100).filter(isSmith).map { String($0) }.joined(separator: " "))
