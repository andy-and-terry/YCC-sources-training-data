// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
func tribonacci(_ count: Int) -> [Int] {
    var t = [0, 0, 1]
    while t.count < count {
        let n = t.count
        t.append(t[n - 1] + t[n - 2] + t[n - 3])
    }
    return Array(t.prefix(count))
}

print("Tribonacci:", tribonacci(15).map(String.init).joined(separator: ", "))
