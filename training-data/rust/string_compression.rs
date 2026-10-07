fn compress(s: &str) -> String {
    let chars: Vec<char> = s.chars().collect();
    let mut out = String::new();
    let mut i = 0;
    while i < chars.len() {
        let j = chars[i..].iter().take_while(|&&c| c == chars[i]).count() + i;
        out.push(chars[i]);
        out.push_str(&(j - i).to_string());
        i = j;
    }
    if out.len() < s.len() { out } else { s.to_string() }
}

fn decompress(s: &str) -> String {
    let mut out = String::new();
    let mut chars = s.chars().peekable();
    while let Some(c) = chars.next() {
        let mut n = String::new();
        while let Some(d) = chars.peek().filter(|d| d.is_ascii_digit()) {
            n.push(*d);
            chars.next();
        }
        out.extend(std::iter::repeat(c).take(n.parse().unwrap_or(1)));
    }
    out
}

fn main() {
    for w in ["aabcccccaaa", "abc", "zzzzzzzzzzzz"] {
        let c = compress(w);
        println!("{} -> {} (roundtrip ok: {})", w, c, c == w || decompress(&c) == w);
    }
}
