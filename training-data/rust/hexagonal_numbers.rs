// Hexagonal numbers: n(2n-1).
fn main() {
    let v: Vec<String> = (1u32..=10).map(|n| (n * (2 * n - 1)).to_string()).collect();
    println!("{}", v.join(" "));
}
