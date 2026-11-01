// Evil numbers have an even number of 1 bits.
fn main() {
    let v: Vec<String> = (0u32..=20)
        .filter(|n| n.count_ones() % 2 == 0)
        .map(|n| n.to_string())
        .collect();
    println!("{}", v.join(" "));
}
