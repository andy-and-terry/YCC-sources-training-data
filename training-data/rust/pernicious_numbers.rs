// Pernicious numbers: the number of set bits is prime.
fn is_prime(n: u32) -> bool {
    n >= 2 && (2..).take_while(|d| d * d <= n).all(|d| n % d != 0)
}

fn main() {
    let v: Vec<String> = (1u32..=20)
        .filter(|n| is_prime(n.count_ones()))
        .map(|n| n.to_string())
        .collect();
    println!("{}", v.join(" "));
}
