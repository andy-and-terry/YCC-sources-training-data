// n(n+1)(n+2)(n+3)/24
fn term(n: i64) -> i64 {
    (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24
}

fn main() {
    for n in 1..=15 {
        println!("{:2} -> {}", n, term(n));
    }
}
