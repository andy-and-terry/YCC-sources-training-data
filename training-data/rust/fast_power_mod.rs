fn mul_mod(a: u64, b: u64, m: u64) -> u64 {
    ((a as u128 * b as u128) % m as u128) as u64
}

fn pow_mod(mut base: u64, mut exp: u64, m: u64) -> u64 {
    let mut result = 1 % m;
    base %= m;
    while exp > 0 {
        if exp & 1 == 1 {
            result = mul_mod(result, base, m);
        }
        base = mul_mod(base, base, m);
        exp >>= 1;
    }
    result
}

/// Deterministic Miller-Rabin for all u64.
fn is_prime(n: u64) -> bool {
    const BASES: [u64; 12] = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37];
    if n < 2 {
        return false;
    }
    if let Some(&p) = BASES.iter().find(|&&p| n % p == 0) {
        return n == p;
    }
    let s = (n - 1).trailing_zeros();
    let d = (n - 1) >> s;
    BASES.iter().all(|&a| {
        let mut x = pow_mod(a, d, n);
        if x == 1 || x == n - 1 {
            return true;
        }
        for _ in 1..s {
            x = mul_mod(x, x, n);
            if x == n - 1 {
                return true;
            }
        }
        false
    })
}

fn main() {
    println!("{} {} {}", pow_mod(2, 10, 1000), pow_mod(3, 200, 13), pow_mod(7, 1_000_000_000_000_000_000, 1_000_000_007));
    for n in [97u64, 561, 1_000_000_007, 18446744073709551557, 18446744073709551559] {
        println!("{} prime? {}", n, is_prime(n));
    }
}
