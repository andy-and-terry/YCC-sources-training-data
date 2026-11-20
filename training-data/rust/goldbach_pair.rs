// Goldbach pair returning an Option.
fn is_prime(n: u32) -> bool {
    n >= 2 && (2..).take_while(|d| d * d <= n).all(|d| n % d != 0)
}

fn goldbach(n: u32) -> Option<(u32, u32)> {
    (2..=n / 2).find(|&p| is_prime(p) && is_prime(n - p)).map(|p| (p, n - p))
}

fn main() {
    println!("{:?}", goldbach(28));
}
