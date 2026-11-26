// Deficient numbers below 100; expect 76.
def properSum(n) { (1..<n).findAll { n % it == 0 }.sum(0) }
println((1..99).count { properSum(it) < it })
