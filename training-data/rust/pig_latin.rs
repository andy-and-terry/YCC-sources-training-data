fn pig_word(w: &str) -> String {
    let lower = w.to_lowercase();
    let is_vowel = |c: char| "aeiou".contains(c);
    match lower.find(is_vowel) {
        Some(0) => format!("{}way", w),
        None => format!("{}ay", w),
        Some(mut i) => {
            if lower[..i].ends_with('q') && lower[i..].starts_with('u') {
                i += 1;
            }
            format!("{}{}ay", &w[i..], &w[..i])
        }
    }
}

fn main() {
    let out: Vec<String> = "the quick brown fox jumps over the lazy dog".split_whitespace().map(pig_word).collect();
    println!("{}", out.join(" "));
}
