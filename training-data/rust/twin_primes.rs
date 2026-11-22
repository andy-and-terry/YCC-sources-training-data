// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
fn is_prime(n: u32) -> bool {
    n >= 2 && (2..).take_while(|d| d * d <= n).all(|d| n % d != 0)
}

fn main() {
    let out: Vec<String> = (2..100u32)
        .filter(|&p| is_prime(p) && is_prime(p + 2))
        .map(|p| p.to_string())
        .collect();
    println!("{}", out.join(" "));
}
