// Emirps: primes whose digit reversal is a different prime.
fn is_prime(n: u32) -> bool {
    n >= 2 && (2..).take_while(|i| i * i <= n).all(|i| n % i != 0)
}

fn reverse(n: u32) -> u32 {
    n.to_string().chars().rev().collect::<String>().parse().unwrap()
}

fn main() {
    let emirps: Vec<u32> = (2..100)
        .filter(|&n| reverse(n) != n && is_prime(n) && is_prime(reverse(n)))
        .collect();
    println!("{:?}", emirps);
}
