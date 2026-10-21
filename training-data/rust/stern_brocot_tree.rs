fn gcd(a: u64, b: u64) -> u64 {
    if b == 0 { a } else { gcd(b, a % b) }
}

fn path(p: u64, q: u64) -> String {
    let g = gcd(p, q);
    let (p, q) = (p / g, q / g);
    let (mut lo, mut hi) = ((0u64, 1u64), (1u64, 0u64));
    let mut s = String::new();
    loop {
        let mid = (lo.0 + hi.0, lo.1 + hi.1);
        if mid == (p, q) {
            return s;
        }
        if p * mid.1 < mid.0 * q {
            s.push('L');
            hi = mid;
        } else {
            s.push('R');
            lo = mid;
        }
    }
}

fn main() {
    println!("{}", path(3, 5));
    assert_eq!(path(1, 1), "");
}
