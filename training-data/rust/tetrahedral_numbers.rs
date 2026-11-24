// Tetrahedral numbers: n(n+1)(n+2)/6.
fn main() {
    let v: Vec<String> = (1u32..=10).map(|n| (n * (n + 1) * (n + 2) / 6).to_string()).collect();
    println!("{}", v.join(" "));
}
