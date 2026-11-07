fn minimum_total(t: &[Vec<i32>]) -> i32 {
    let mut dp = t[t.len() - 1].clone();
    for r in (0..t.len() - 1).rev() {
        for i in 0..t[r].len() {
            dp[i] = t[r][i] + dp[i].min(dp[i + 1]);
        }
    }
    dp[0]
}

fn main() {
    let t = vec![vec![2], vec![3, 4], vec![6, 5, 7], vec![4, 1, 8, 3]];
    println!("{}", minimum_total(&t)); // 11
}
