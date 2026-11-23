// n^2(n+1)/2
fn term(n: i64) -> i64 {
    ((n * n) * (n + 1)) / 2
}

fn main() {
    for n in 1..=15 {
        println!("{:2} -> {}", n, term(n));
    }
}
