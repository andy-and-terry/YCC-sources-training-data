fn lcs(a: &str, b: &str) -> String {
    let a: Vec<char> = a.chars().collect();
    let b: Vec<char> = b.chars().collect();
    let (m, n) = (a.len(), b.len());
    let mut dp = vec![vec![String::new(); n + 1]; m + 1];
    for i in 1..=m {
        for j in 1..=n {
            if a[i - 1] == b[j - 1] {
                dp[i][j] = format!("{}{}", dp[i - 1][j - 1], a[i - 1]);
            } else if dp[i - 1][j].len() >= dp[i][j - 1].len() {
                dp[i][j] = dp[i - 1][j].clone();
            } else {
                dp[i][j] = dp[i][j - 1].clone();
            }
        }
    }
    dp[m][n].clone()
}

fn main() {
    println!("{}", lcs("ABCBDAB", "BDCABA"));
}
