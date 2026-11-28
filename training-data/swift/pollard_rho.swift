func gcd(_ a: Int, _ b: Int) -> Int { b == 0 ? a : gcd(b, a % b) }

func rho(_ n: Int) -> Int {
    if n % 2 == 0 { return 2 }
    let f = { (v: Int) in (v * v + 1) % n }
    var x = 2, y = 2, d = 1
    while d == 1 {
        x = f(x); y = f(f(y))
        d = gcd(abs(x - y), n)
    }
    return d
}

let n = 8051
let p = rho(n)
print("\(n) = \(p) * \(n / p)")
