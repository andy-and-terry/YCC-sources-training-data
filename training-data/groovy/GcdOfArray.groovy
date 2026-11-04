int gcd(int a, int b) { b == 0 ? Math.abs(a) : gcd(b, a % b) }

int gcdAll(int... nums) { nums.inject(0) { acc, n -> gcd(acc, n) } }

println gcdAll(12, 18, 24)
println gcdAll(7, 13)
