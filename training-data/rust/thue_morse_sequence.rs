// Thue-Morse: t(n) is the parity of the number of 1 bits in n
fn main() {
    let s: String = (0u32..32)
        .map(|n| if n.count_ones() % 2 == 0 { '0' } else { '1' })
        .collect();
    println!("{}", s);
}
