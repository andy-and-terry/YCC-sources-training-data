fn split_words(s: &str) -> Vec<String> {
    let chars: Vec<char> = s.chars().collect();
    let mut words = Vec::new();
    let mut cur = String::new();
    for (i, &c) in chars.iter().enumerate() {
        if matches!(c, '_' | '-' | ' ') {
            if !cur.is_empty() {
                words.push(std::mem::take(&mut cur));
            }
            continue;
        }
        if c.is_uppercase() && i > 0 && !cur.is_empty() {
            let prev = chars[i - 1];
            let next_lower = chars.get(i + 1).is_some_and(|n| n.is_lowercase());
            if prev.is_lowercase() || prev.is_ascii_digit() || (prev.is_uppercase() && next_lower) {
                words.push(std::mem::take(&mut cur));
            }
        }
        cur.extend(c.to_lowercase());
    }
    if !cur.is_empty() {
        words.push(cur);
    }
    words
}

fn capitalize(w: &str) -> String {
    let mut c = w.chars();
    c.next().map(|f| f.to_uppercase().chain(c).collect()).unwrap_or_default()
}

fn main() {
    for s in ["parseHTTPResponse", "user_id", "background-color", "XMLHttpRequest"] {
        let w = split_words(s);
        let camel: String = w.iter().enumerate().map(|(i, x)| if i == 0 { x.clone() } else { capitalize(x) }).collect();
        let pascal: String = w.iter().map(|x| capitalize(x)).collect();
        println!("{:18} {:18} {:18} {:20} {}", s, camel, pascal, w.join("_"), w.join("-"));
    }
}
