// Tetrahedral numbers n(n+1)(n+2)/6
fn term(n: u64) -> u64 {
    ((n * (n + 1)) * (n + 2))/6
}

fn main() {
    let out: Vec<String> = (0..10).map(|n| term(n).to_string()).collect();
    println!("{}", out.join(" "));
}
