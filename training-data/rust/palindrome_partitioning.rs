fn is_palindrome(s: &[char]) -> bool {
    let (mut i, mut j) = (0, s.len().saturating_sub(1));
    while i < j {
        if s[i] != s[j] {
            return false;
        }
        i += 1;
        j -= 1;
    }
    true
}

fn partition(s: &str) -> Vec<Vec<String>> {
    let chars: Vec<char> = s.chars().collect();
    let mut result = vec![];
    let mut path = vec![];

    fn backtrack(start: usize, chars: &[char], path: &mut Vec<String>, result: &mut Vec<Vec<String>>) {
        if start == chars.len() {
            result.push(path.clone());
            return;
        }
        for end in start + 1..=chars.len() {
            if is_palindrome(&chars[start..end]) {
                path.push(chars[start..end].iter().collect());
                backtrack(end, chars, path, result);
                path.pop();
            }
        }
    }

    backtrack(0, &chars, &mut path, &mut result);
    result
}

fn main() {
    println!("{:?}", partition("aab"));
}
