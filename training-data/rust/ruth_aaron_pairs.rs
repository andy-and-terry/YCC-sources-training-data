// Sum of prime factors counted with multiplicity.
fn sopfr(mut n: u32) -> u32 {
    let mut total = 0;
    let mut p = 2;
    while p * p <= n {
        while n % p == 0 {
            total += p;
            n /= p;
        }
        p += 1;
    }
    if n > 1 {
        total += n;
    }
    total
}

fn main() {
    let v: Vec<String> = (2..110)
        .filter(|&n| sopfr(n) == sopfr(n + 1))
        .map(|n| n.to_string())
        .collect();
    println!("{}", v.join(" "));
}
