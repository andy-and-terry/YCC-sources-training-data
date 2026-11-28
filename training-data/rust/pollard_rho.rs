fn gcd(a: u64, b: u64) -> u64 {
    if b == 0 { a } else { gcd(b, a % b) }
}

fn rho(n: u64) -> u64 {
    if n % 2 == 0 {
        return 2;
    }
    let f = |v: u64| (v * v + 1) % n;
    let (mut x, mut y, mut d) = (2, 2, 1);
    while d == 1 {
        x = f(x);
        y = f(f(y));
        d = gcd(x.abs_diff(y), n);
    }
    d
}

fn main() {
    let n = 8051;
    let p = rho(n);
    println!("{n} = {p} * {}", n / p);
}
