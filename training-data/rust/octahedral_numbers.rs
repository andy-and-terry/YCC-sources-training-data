// n(2n^2+1)/3
fn term(n: i64) -> i64 {
    (n * (((2 * n) * n) + 1)) / 3
}

fn main() {
    for n in 1..=15 {
        println!("{:2} -> {}", n, term(n));
    }
}
