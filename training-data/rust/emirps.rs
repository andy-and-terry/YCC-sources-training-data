// Emirps below 200; expect 15.
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

fn rev(n: u64) -> u64 {
    n.to_string().chars().rev().collect::<String>().parse().unwrap()
}

fn main() {
    let found: Vec<u64> = (2..200).filter(|&n| rev(n) != n && is_prime(n) && is_prime(rev(n))).collect();
    println!("{} {:?}", found.len(), found);
}
