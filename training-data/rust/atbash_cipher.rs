fn transform(s: &str) -> impl Iterator<Item = char> + '_ {
    s.chars().filter(char::is_ascii_alphanumeric).map(|c| {
        let c = c.to_ascii_lowercase();
        if c.is_ascii_lowercase() { (b'z' - (c as u8 - b'a')) as char } else { c }
    })
}

fn encode(s: &str) -> String {
    let t: Vec<char> = transform(s).collect();
    t.chunks(5).map(|ch| ch.iter().collect::<String>()).collect::<Vec<_>>().join(" ")
}

fn decode(s: &str) -> String {
    transform(s).collect()
}

fn main() {
    let e = encode("The quick brown fox");
    println!("{e} -> {}", decode(&e));
}
