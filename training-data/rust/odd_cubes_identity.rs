fn cube_from_odds(n: u64) -> u64 {
    let start = n * n - n + 1;
    (0..n).map(|i| start + 2 * i).sum()
}

fn main() {
    for n in 1..=5 {
        println!("{} {} {}", n, cube_from_odds(n), cube_from_odds(n) == n.pow(3));
    }
}
