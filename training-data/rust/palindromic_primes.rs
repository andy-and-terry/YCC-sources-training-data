// Palindromic primes below 200; expect 10.
fn is_prime(n: u32) -> bool {
    n > 1 && (2..).take_while(|d| d * d <= n).all(|d| n % d != 0)
}

fn is_palindrome(n: u32) -> bool {
    let s = n.to_string();
    s.chars().eq(s.chars().rev())
}

fn main() {
    let found: Vec<u32> = (2..200).filter(|&n| is_palindrome(n) && is_prime(n)).collect();
    println!("{:?} {}", found, found.len());
}
