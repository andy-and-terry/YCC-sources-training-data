// Centered square numbers: n^2 + (n+1)^2.
fn main() {
    let v: Vec<String> = (0u32..10).map(|n| (n * n + (n + 1) * (n + 1)).to_string()).collect();
    println!("{}", v.join(" "));
}
