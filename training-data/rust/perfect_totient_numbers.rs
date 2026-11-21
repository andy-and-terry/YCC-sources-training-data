// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
fn gcd(a: u32, b: u32) -> u32 {
    if b == 0 { a } else { gcd(b, a % b) }
}

fn phi(n: u32) -> u32 {
    (1..=n).filter(|&k| gcd(k, n) == 1).count() as u32
}

fn is_perfect_totient(n: u32) -> bool {
    let (mut total, mut m) = (0, n);
    while m > 1 {
        m = phi(m);
        total += m;
    }
    total == n
}

fn main() {
    let out: Vec<String> = (2..200).filter(|&n| is_perfect_totient(n)).map(|n| n.to_string()).collect();
    println!("{}", out.join(" "));
}
