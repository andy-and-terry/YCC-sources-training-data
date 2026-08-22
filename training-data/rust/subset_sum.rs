fn has_subset_sum(nums: &[i32], target: usize) -> bool {
    let n = nums.len();
    let mut dp = vec![vec![false; target + 1]; n + 1];
    for i in 0..=n {
        dp[i][0] = true;
    }
    for i in 1..=n {
        for t in 1..=target {
            dp[i][t] = dp[i - 1][t];
            if (nums[i - 1] as usize) <= t {
                dp[i][t] = dp[i][t] || dp[i - 1][t - nums[i - 1] as usize];
            }
        }
    }
    dp[n][target]
}

fn main() {
    println!("{}", has_subset_sum(&[3, 34, 4, 12, 5, 2], 9));
}
