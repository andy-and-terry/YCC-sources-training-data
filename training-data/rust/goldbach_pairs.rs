fn is_prime(n: u32) -> bool {
    n >= 2 && (2..).take_while(|d| d * d <= n).all(|d| n % d != 0)
}

fn main() {
    let n = 28;
    for p in 2..=n / 2 {
        if is_prime(p) && is_prime(n - p) {
            println!("{} + {}", p, n - p);
        }
    }
}
