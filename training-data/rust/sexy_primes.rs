// Sexy primes below 100; expect 16 pairs.
fn is_prime(n: u64) -> bool {
    if n < 2 {
        return false;
    }
    let mut d = 2;
    while d * d <= n {
        if n % d == 0 {
            return false;
        }
        d += 1;
    }
    true
}

fn main() {
    println!("{}", (2..100).filter(|&p| is_prime(p) && is_prime(p + 6)).count());
}
