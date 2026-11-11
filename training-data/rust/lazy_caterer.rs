// Lazy caterer sequence: max pieces from n cuts
fn term(n: u64) -> u64 {
    ((n * (n + 1))/2) + 1
}

fn main() {
    let out: Vec<String> = (0..10).map(|n| term(n).to_string()).collect();
    println!("{}", out.join(" "));
}
