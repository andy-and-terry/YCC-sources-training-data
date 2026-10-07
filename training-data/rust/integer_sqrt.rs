fn isqrt(n: u64) -> u64 {
    if n < 2 {
        return n;
    }
    let mut x = n;
    let mut y = x / 2;
    while y < x {
        x = y;
        y = (x + n / x) / 2;
    }
    x
}

fn iroot(n: u64, k: u32) -> u64 {
    let (mut lo, mut hi) = (0u64, (n as f64).powf(1.0 / k as f64) as u64 + 2);
    while lo < hi {
        let mid = lo + (hi - lo + 1) / 2;
        match mid.checked_pow(k) {
            Some(p) if p <= n => lo = mid,
            _ => hi = mid - 1,
        }
    }
    lo
}

fn main() {
    for n in [0u64, 1, 2, 3, 15, 16, 17, u64::MAX] {
        assert_eq!(isqrt(n), n.isqrt());
        println!("isqrt({}) = {}", n, isqrt(n));
    }
    println!("cbrt(10^18) = {}, 5th root of 2^60 = {}", iroot(1_000_000_000_000_000_000, 3), iroot(1 << 60, 5));
}
