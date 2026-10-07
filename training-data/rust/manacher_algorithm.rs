// Manacher's algorithm finds the longest palindromic substring in
// O(n) by transforming the string with separators (so every palindrome
// has odd length) and reusing previously computed radii to avoid
// re-scanning characters already covered by a known palindrome.
fn longest_palindrome(s: &str) -> String {
    if s.is_empty() {
        return String::new();
    }

    let chars: Vec<char> = s.chars().collect();
    let mut transformed = vec!['#'];
    for &c in &chars {
        transformed.push(c);
        transformed.push('#');
    }

    let n = transformed.len();
    let mut radius = vec![0usize; n];
    let mut center = 0;
    let mut right = 0;
    let mut best_center = 0;
    let mut best_radius = 0;

    for i in 0..n {
        if i < right {
            let mirror = 2 * center - i;
            radius[i] = radius[mirror].min(right - i);
        }

        while i >= radius[i] + 1
            && i + radius[i] + 1 < n
            && transformed[i - radius[i] - 1] == transformed[i + radius[i] + 1]
        {
            radius[i] += 1;
        }

        if i + radius[i] > right {
            center = i;
            right = i + radius[i];
        }

        if radius[i] > best_radius {
            best_radius = radius[i];
            best_center = i;
        }
    }

    let start = (best_center - best_radius) / 2;
    chars[start..start + best_radius].iter().collect()
}

fn main() {
    println!("{}", longest_palindrome("babad"));
    println!("{}", longest_palindrome("cbbd"));
    println!("{}", longest_palindrome("forgeeksskeegfor"));
    println!("{:?}", longest_palindrome(""));
}
