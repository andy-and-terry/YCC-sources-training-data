// Fermat primality test; Carmichael number 561 fools it.
fn powmod(mut base: u64, mut exp: u64, m: u64) -> u64 {
    let mut result = 1;
    base %= m;
    while exp > 0 {
        if exp & 1 == 1 {
            result = result * base % m;
        }
        base = base * base % m;
        exp >>= 1;
    }
    result
}

fn probably_prime(n: u64) -> bool {
    n > 2 && powmod(2, n - 1, n) == 1
}

fn main() {
    for n in [97, 91, 561] {
        println!("{} {}", n, probably_prime(n));
    }
}
