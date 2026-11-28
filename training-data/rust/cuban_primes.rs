fn is_prime(n: u64) -> bool {
    n >= 2 && (2..).take_while(|i| i * i <= n).all(|i| n % i != 0)
}

fn main() {
    let v: Vec<u64> = (1u64..)
        .map(|y| 3 * y * y + 3 * y + 1)
        .filter(|&p| is_prime(p))
        .take(8)
        .collect();
    println!("{:?}", v);
}
