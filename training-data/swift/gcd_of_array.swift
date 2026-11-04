func gcd(_ a: Int, _ b: Int) -> Int {
    b == 0 ? abs(a) : gcd(b, a % b)
}

func gcdAll(_ nums: Int...) -> Int {
    nums.reduce(0, gcd)
}

print(gcdAll(12, 18, 24))
print(gcdAll(7, 13))
