// Wilson's theorem primality test.
fn wilson(n: u64) -> bool {
    n >= 2 && (2..n).fold(1u64, |f, i| f * i % n) == n - 1
}

fn main() {
    let primes: Vec<u64> = (2..20).filter(|&n| wilson(n)).collect();
    println!("{:?}", primes);
}
