fn fletcher16(data: &[u8]) -> u16 {
    let (mut s1, mut s2) = (0u16, 0u16);
    for &b in data {
        s1 = (s1 + b as u16) % 255;
        s2 = (s2 + s1) % 255;
    }
    (s2 << 8) | s1
}

fn main() {
    println!("{:#x}", fletcher16(b"abcde"));
}
