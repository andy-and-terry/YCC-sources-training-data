fn longest_common_substring(a: &str, b: &str) -> String {
    let a: Vec<char> = a.chars().collect();
    let b: Vec<char> = b.chars().collect();
    let mut dp = vec![vec![0usize; b.len() + 1]; a.len() + 1];
    let mut best_len = 0;
    let mut best_end = 0;

    for i in 1..=a.len() {
        for j in 1..=b.len() {
            if a[i - 1] == b[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1;
                if dp[i][j] > best_len {
                    best_len = dp[i][j];
                    best_end = i;
                }
            }
        }
    }
    a[best_end - best_len..best_end].iter().collect()
}

fn main() {
    let a = "abcdefghi";
    let b = "xyzcdefpqr";
    println!("longest common substring: {:?}", longest_common_substring(a, b));
}
