// Highest value reached by the Collatz (hailstone) sequence from n.
fn peak(mut n: u64) -> u64 {
    let mut best = n;
    while n != 1 {
        n = if n % 2 == 0 { n / 2 } else { 3 * n + 1 };
        best = best.max(n);
    }
    best
}

fn main() {
    println!("{}", peak(27));
}
