use std::collections::HashMap;

fn longest_unique(s: &str) -> &str {
    let mut last: HashMap<char, usize> = HashMap::new();
    let (mut start, mut best) = (0usize, (0usize, 0usize));
    for (i, c) in s.char_indices() {
        if let Some(&p) = last.get(&c) {
            if p >= start {
                start = p + c.len_utf8();
            }
        }
        last.insert(c, i);
        let end = i + c.len_utf8();
        if end - start > best.1 - best.0 {
            best = (start, end);
        }
    }
    &s[best.0..best.1]
}

fn main() {
    for s in ["abcabcbb", "bbbbb", "pwwkew", "dvdf", "héllo wörld"] {
        let r = longest_unique(s);
        println!("{} -> {:?} ({} chars)", s, r, r.chars().count());
    }
}
