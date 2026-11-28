fn reverse_bits(mut v: u8) -> u8 {
    let mut r = 0u8;
    for _ in 0..8 {
        r = (r << 1) | (v & 1);
        v >>= 1;
    }
    r
}

fn main() {
    for v in [1u8, 6, 13, 128] {
        println!("{} {} {}", v, reverse_bits(v), v.reverse_bits()); // 128 96 176 1
    }
}
