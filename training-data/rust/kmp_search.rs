fn build_lps(pattern: &[u8]) -> Vec<usize> {
    let mut lps = vec![0; pattern.len()];
    let mut length = 0;
    let mut i = 1;
    while i < pattern.len() {
        if pattern[i] == pattern[length] {
            length += 1;
            lps[i] = length;
            i += 1;
        } else if length != 0 {
            length = lps[length - 1];
        } else {
            lps[i] = 0;
            i += 1;
        }
    }
    lps
}

fn kmp_search(text: &str, pattern: &str) -> Vec<usize> {
    let text = text.as_bytes();
    let pattern = pattern.as_bytes();
    if pattern.is_empty() {
        return vec![];
    }
    let lps = build_lps(pattern);
    let mut matches = vec![];
    let (mut i, mut j) = (0, 0);
    while i < text.len() {
        if text[i] == pattern[j] {
            i += 1;
            j += 1;
            if j == pattern.len() {
                matches.push(i - j);
                j = lps[j - 1];
            }
        } else if j != 0 {
            j = lps[j - 1];
        } else {
            i += 1;
        }
    }
    matches
}

fn main() {
    println!("{:?}", kmp_search("abxabcabcaby", "abcaby"));
}
