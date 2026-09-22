use std::collections::HashSet;

fn word_break(s: &str, word_dict: &[&str]) -> bool {
    let words: HashSet<&str> = word_dict.iter().copied().collect();
    let chars: Vec<char> = s.chars().collect();
    let n = chars.len();
    let mut dp = vec![false; n + 1];
    dp[0] = true;

    for i in 1..=n {
        for j in 0..i {
            if dp[j] {
                let candidate: String = chars[j..i].iter().collect();
                if words.contains(candidate.as_str()) {
                    dp[i] = true;
                    break;
                }
            }
        }
    }

    dp[n]
}

fn main() {
    let dict = ["leet", "code", "leetcode", "sand", "and", "sandbox"];
    println!("{}", word_break("leetcode", &dict));
    println!("{}", word_break("leetsandbox", &dict));
    println!("{}", word_break("leetcat", &dict));
}
