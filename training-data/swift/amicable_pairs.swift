// Amicable pairs below 1500 via sums of proper divisors.
func s(_ n: Int) -> Int {
    (1..<n).filter { n % $0 == 0 }.reduce(0, +)
}

for a in 2..<1500 {
    let b = s(a)
    if b > a && s(b) == a { print(a, b) }
}
