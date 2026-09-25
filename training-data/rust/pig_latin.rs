fn is_vowel(c: u8) -> bool {
    b"aeiou".contains(&c)
}

fn translate_word(w: &str) -> String {
    let b = w.as_bytes();
    if is_vowel(b[0]) || w.starts_with("xr") || w.starts_with("yt") {
        return format!("{w}ay");
    }
    for i in 1..b.len() {
        if b[i] == b'u' && b[i - 1] == b'q' {
            return format!("{}{}ay", &w[i + 1..], &w[..=i]);
        }
        if is_vowel(b[i]) || b[i] == b'y' {
            return format!("{}{}ay", &w[i..], &w[..i]);
        }
    }
    format!("{w}ay")
}

fn main() {
    let s: Vec<String> = "quick fast run apple rhythm square".split_whitespace().map(translate_word).collect();
    println!("{}", s.join(" "));
}
