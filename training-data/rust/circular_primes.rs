// Circular primes below 100; expect 13.
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

fn circular(n: u64) -> bool {
    let s = n.to_string();
    (0..s.len()).all(|i| is_prime(format!("{}{}", &s[i..], &s[..i]).parse().unwrap()))
}

fn main() {
    println!("{}", (2..100).filter(|&n| circular(n)).count());
}
