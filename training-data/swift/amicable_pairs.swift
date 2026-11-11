// Amicable pairs: d(a) == b and d(b) == a with a != b.
func d(_ n: Int) -> Int {
    (1..<n).filter { n % $0 == 0 }.reduce(0, +)
}

for a in 2..<1500 {
    let b = d(a)
    if b > a && d(b) == a { print("(\(a), \(b))") }
}
