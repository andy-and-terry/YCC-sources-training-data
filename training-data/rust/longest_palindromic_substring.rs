fn expand(chars: &[char], mut left: i32, mut right: i32) -> (usize, usize) {
    while left >= 0 && (right as usize) < chars.len() && chars[left as usize] == chars[right as usize] {
        left -= 1;
        right += 1;
    }
    ((left + 1) as usize, (right - 1) as usize)
}

fn longest_palindromic_substring(s: &str) -> String {
    let chars: Vec<char> = s.chars().collect();
    if chars.is_empty() {
        return String::new();
    }
    let (mut best_start, mut best_end) = (0usize, 0usize);
    for i in 0..chars.len() {
        let (s1, e1) = expand(&chars, i as i32, i as i32);
        if e1 - s1 > best_end - best_start {
            best_start = s1;
            best_end = e1;
        }
        if i + 1 < chars.len() {
            let (s2, e2) = expand(&chars, i as i32, i as i32 + 1);
            if e2 >= s2 && e2 - s2 > best_end - best_start {
                best_start = s2;
                best_end = e2;
            }
        }
    }
    chars[best_start..=best_end].iter().collect()
}

fn main() {
    println!("{}", longest_palindromic_substring("babad"));
    println!("{}", longest_palindromic_substring("cbbd"));
}
