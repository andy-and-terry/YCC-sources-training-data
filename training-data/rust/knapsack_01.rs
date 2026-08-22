fn knapsack(weights: &[usize], values: &[i32], capacity: usize) -> i32 {
    let n = weights.len();
    let mut dp = vec![vec![0; capacity + 1]; n + 1];
    for i in 1..=n {
        for w in 0..=capacity {
            dp[i][w] = dp[i - 1][w];
            if weights[i - 1] <= w {
                dp[i][w] = dp[i][w].max(dp[i - 1][w - weights[i - 1]] + values[i - 1]);
            }
        }
    }
    dp[n][capacity]
}

fn main() {
    println!("{}", knapsack(&[1, 3, 4, 5], &[1, 4, 5, 7], 7));
}
