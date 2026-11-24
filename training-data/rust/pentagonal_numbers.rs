// Pentagonal numbers: n(3n-1)/2.
fn main() {
    let v: Vec<String> = (1u32..=10).map(|n| (n * (3 * n - 1) / 2).to_string()).collect();
    println!("{}", v.join(" "));
}
