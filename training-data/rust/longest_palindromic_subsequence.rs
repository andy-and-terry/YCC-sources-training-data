fn lps(s: &str) -> String {
    let b: Vec<char> = s.chars().collect();
    let n = b.len();
    if n == 0 {
        return String::new();
    }
    let mut dp = vec![vec![0usize; n]; n];
    for i in (0..n).rev() {
        dp[i][i] = 1;
        for j in i + 1..n {
            dp[i][j] = if b[i] == b[j] {
                (if i + 1 <= j - 1 { dp[i + 1][j - 1] } else { 0 }) + 2
            } else {
                dp[i + 1][j].max(dp[i][j - 1])
            };
        }
    }
    let (mut left, mut right) = (String::new(), String::new());
    let (mut i, mut j) = (0usize, n - 1);
    while i <= j {
        if i == j {
            left.push(b[i]);
            break;
        }
        if b[i] == b[j] {
            left.push(b[i]);
            right.insert(0, b[j]);
            i += 1;
            j -= 1;
        } else if dp[i + 1][j] >= dp[i][j - 1] {
            i += 1;
        } else {
            j -= 1;
        }
    }
    left + &right
}

fn main() {
    for s in ["bbbab", "character", "agbdba", "cbbd"] {
        println!("{} -> {}", s, lps(s));
    }
}
