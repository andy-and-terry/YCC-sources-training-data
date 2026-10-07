fn phi(mut n: u64) -> u64 {
    let mut result = n;
    let mut p = 2;
    while p * p <= n {
        if n % p == 0 {
            while n % p == 0 {
                n /= p;
            }
            result -= result / p;
        }
        p += 1;
    }
    if n > 1 {
        result -= result / n;
    }
    result
}

fn phi_sieve(limit: usize) -> Vec<u32> {
    let mut t: Vec<u32> = (0..=limit as u32).collect();
    for i in 2..=limit {
        if t[i] == i as u32 {
            for j in (i..=limit).step_by(i) {
                t[j] -= t[j] / i as u32;
            }
        }
    }
    t
}

fn main() {
    let t = phi_sieve(1_000_000);
    println!("{:?}", &t[1..21]);
    let sum: u64 = t[2..].iter().map(|&x| x as u64).sum();
    println!("sum phi(2..1e6) = {}, phi(10^12) = {}", sum, phi(1_000_000_000_000));
}
