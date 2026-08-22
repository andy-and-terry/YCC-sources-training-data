fn encode(s: &str) -> String {
    let chars: Vec<char> = s.chars().collect();
    if chars.is_empty() {
        return String::new();
    }
    let mut result = String::new();
    let mut count = 1;
    for i in 1..=chars.len() {
        if i < chars.len() && chars[i] == chars[i - 1] {
            count += 1;
        } else {
            result.push(chars[i - 1]);
            result.push_str(&count.to_string());
            count = 1;
        }
    }
    result
}

fn main() {
    println!("{}", encode("aaabbbccd"));
}
