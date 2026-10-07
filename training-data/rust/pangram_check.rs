fn is_pangram(s: &str) -> bool {
    let mask = s
        .bytes()
        .filter(u8::is_ascii_alphabetic)
        .fold(0u32, |m, b| m | 1 << (b.to_ascii_lowercase() - b'a'));
    mask == (1 << 26) - 1
}

fn main() {
    println!("{}", is_pangram("The quick brown fox jumps over the lazy dog"));
    println!("{}", is_pangram("Hello world"));
}
