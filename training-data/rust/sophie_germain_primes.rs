fn is_prime(n: u64) -> bool {
    n >= 2 && (2..).take_while(|d| d * d <= n).all(|d| n % d != 0)
}

fn main() {
    let found: Vec<u64> = (2..)
        .filter(|&p| is_prime(p) && is_prime(2 * p + 1))
        .take(10)
        .collect();
    println!("{:?}", found); // [2, 3, 5, 11, 23, 29, 41, 53, 83, 89]
}
