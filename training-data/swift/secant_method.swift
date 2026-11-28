func secant(_ f: (Double) -> Double, _ a: Double, _ b: Double) -> Double {
    var x0 = a, x1 = b
    for _ in 0..<50 {
        let f0 = f(x0), f1 = f(x1)
        if f1 == f0 { break }
        (x0, x1) = (x1, x1 - f1 * (x1 - x0) / (f1 - f0))
        if abs(x1 - x0) < 1e-12 { break }
    }
    return x1
}

print(secant({ $0 * $0 - 2 }, 1, 2))
