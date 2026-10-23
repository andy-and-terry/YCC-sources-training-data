fn is_prime(n: u64) -> bool {
    n > 1 && (2..).take_while(|d| d * d <= n).all(|d| n % d != 0)
}

fn lucas_lehmer(p: u32) -> bool {
    if p == 2 {
        return true;
    }
    let m: u64 = (1u64 << p) - 1;
    let mut s: u64 = 4;
    for _ in 0..p - 2 {
        s = (s * s + m - 2) % m;
    }
    s == 0
}

fn main() {
    let exps: Vec<String> = (2..=19u32)
        .filter(|&p| is_prime(p as u64) && lucas_lehmer(p))
        .map(|p| p.to_string())
        .collect();
    println!("{}", exps.join(" "));
}
