// Population count (number of set bits) for 0..15
fn main() {
    let out: Vec<String> = (0u32..16).map(|n| n.count_ones().to_string()).collect();
    println!("{}", out.join(" "));
}
