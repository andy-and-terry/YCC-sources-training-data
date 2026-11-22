// Emirps: primes whose digit reversal is a different prime.
fn is_prime(n: u32) -> bool {
    n >= 2 && (2..).take_while(|d| d * d <= n).all(|d| n % d != 0)
}

fn reverse(mut n: u32) -> u32 {
    let mut r = 0;
    while n > 0 {
        r = r * 10 + n % 10;
        n /= 10;
    }
    r
}

fn main() {
    let out: Vec<String> = (2..200u32)
        .filter(|&n| {
            let r = reverse(n);
            r != n && is_prime(n) && is_prime(r)
        })
        .map(|n| n.to_string())
        .collect();
    println!("{}", out.join(" "));
}
