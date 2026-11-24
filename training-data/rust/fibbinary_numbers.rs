// Fibbinary numbers: no two adjacent 1 bits.
fn main() {
    let v: Vec<String> = (0u32..50)
        .filter(|n| n & (n >> 1) == 0)
        .map(|n| n.to_string())
        .collect();
    println!("{}", v.join(" "));
}
