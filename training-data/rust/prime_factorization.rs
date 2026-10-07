fn prime_factors(mut n: u64) -> Vec<(u64, u32)> {
    let mut factors = Vec::new();
    let mut d = 2u64;
    while d * d <= n {
        if n % d == 0 {
            let mut exponent = 0;
            while n % d == 0 {
                n /= d;
                exponent += 1;
            }
            factors.push((d, exponent));
        }
        d += if d == 2 { 1 } else { 2 };
    }
    if n > 1 {
        factors.push((n, 1));
    }
    factors
}

fn main() {
    println!("{:?}", prime_factors(360));
    println!("{:?}", prime_factors(97));
    println!("{:?}", prime_factors(1));
}
