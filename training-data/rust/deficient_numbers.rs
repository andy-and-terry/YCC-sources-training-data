// Deficient numbers below 100; expect 76.
fn proper_sum(n: u32) -> u32 {
    (1..n).filter(|d| n % d == 0).sum()
}

fn main() {
    println!("{}", (1..100).filter(|&n| proper_sum(n) < n).count());
}
