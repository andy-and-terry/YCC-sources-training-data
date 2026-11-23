// n(n+1)/2+1
fn term(n: i64) -> i64 {
    ((n * (n + 1)) / 2) + 1
}

fn main() {
    for n in 1..=15 {
        println!("{:2} -> {}", n, term(n));
    }
}
