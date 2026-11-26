// Primorials up to 1e6, including 1; expect 8.
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

fn main() {
    let mut v = vec![1u64];
    let mut acc = 1u64;
    let mut p = 2;
    loop {
        if is_prime(p) {
            acc *= p;
            if acc > 1_000_000 {
                break;
            }
            v.push(acc);
        }
        p += 1;
    }
    println!("{:?} {}", v, v.len());
}
