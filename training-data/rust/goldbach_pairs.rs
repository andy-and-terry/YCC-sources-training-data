// Goldbach partitions of 100; expect 6.
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
    let pairs: Vec<(u64, u64)> = (2..=50).filter(|&p| is_prime(p) && is_prime(100 - p)).map(|p| (p, 100 - p)).collect();
    println!("{:?} {}", pairs, pairs.len());
}
