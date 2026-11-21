// Amicable pairs below 1500 via sums of proper divisors.
fn s(n: u32) -> u32 {
    (1..n).filter(|d| n % d == 0).sum()
}

fn main() {
    for a in 2..1500 {
        let b = s(a);
        if b > a && s(b) == a {
            println!("{} {}", a, b);
        }
    }
}
