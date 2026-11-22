// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
fn main() {
    let out: Vec<String> = (0..10u32).map(|n| (n * (n + 1) / 2 + 1).to_string()).collect();
    println!("{}", out.join(" "));
}
