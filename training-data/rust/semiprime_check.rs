fn prime_factor_count(mut n: u32) -> u32 {
    let mut count = 0;
    let mut p = 2;
    while p * p <= n {
        while n % p == 0 {
            n /= p;
            count += 1;
        }
        p += 1;
    }
    if n > 1 {
        count += 1;
    }
    count
}

fn main() {
    let semiprimes: Vec<u32> = (2..30).filter(|&n| prime_factor_count(n) == 2).collect();
    println!("{:?}", semiprimes);
}
