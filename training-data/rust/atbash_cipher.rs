fn atbash(s: &str) -> String {
    s.chars()
        .map(|c| match c {
            'a'..='z' => (b'z' - (c as u8 - b'a')) as char,
            'A'..='Z' => (b'Z' - (c as u8 - b'A')) as char,
            _ => c,
        })
        .collect()
}

fn main() {
    let enc = atbash("Hello, World!");
    println!("{} | {}", enc, atbash(&enc));
}
