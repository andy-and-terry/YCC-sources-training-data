// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
fn gcd(a: u64, b: u64) -> u64 {
    if b == 0 { a } else { gcd(b, a % b) }
}

fn pow_mod(mut b: u64, mut e: u64, m: u64) -> u64 {
    let mut r = 1;
    b %= m;
    while e > 0 {
        if e & 1 == 1 {
            r = r * b % m;
        }
        b = b * b % m;
        e >>= 1;
    }
    r
}

fn is_prime(n: u64) -> bool {
    n > 1 && (2..).take_while(|p| p * p <= n).all(|p| n % p != 0)
}

fn is_carmichael(n: u64) -> bool {
    !is_prime(n) && (2..n).all(|a| gcd(a, n) != 1 || pow_mod(a, n - 1, n) == 1)
}

fn main() {
    let out: Vec<String> = (3..3000)
        .step_by(2)
        .filter(|&n| is_carmichael(n))
        .map(|n| n.to_string())
        .collect();
    println!("{}", out.join(" "));
}
