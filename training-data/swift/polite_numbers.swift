// Ways to write n as a sum of two or more consecutive positive integers.
func politeWays(_ n: Int) -> Int {
    var ways = 0
    var k = 2
    while k * (k + 1) / 2 <= n {
        if (n - k * (k - 1) / 2) % k == 0 { ways += 1 }
        k += 1
    }
    return ways
}

print((1...16).map { String(politeWays($0)) }.joined(separator: " "))
