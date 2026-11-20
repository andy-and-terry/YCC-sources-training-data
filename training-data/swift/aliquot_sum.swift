// Aliquot sum with a switch on comparison.
for n in [6, 12, 15, 28] {
    let a = (1..<n).filter { n % $0 == 0 }.reduce(0, +)
    let kind: String
    switch a {
    case n: kind = "perfect"
    case (n + 1)...: kind = "abundant"
    default: kind = "deficient"
    }
    print(n, a, kind)
}
