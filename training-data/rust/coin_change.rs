fn coin_change(coins: &[i32], amount: usize) -> i32 {
    let mut dp = vec![i32::MAX; amount + 1];
    dp[0] = 0;
    for a in 1..=amount {
        for &coin in coins {
            if coin as usize <= a && dp[a - coin as usize] != i32::MAX {
                dp[a] = dp[a].min(dp[a - coin as usize] + 1);
            }
        }
    }
    if dp[amount] == i32::MAX {
        -1
    } else {
        dp[amount]
    }
}

fn main() {
    println!("{}", coin_change(&[1, 2, 5], 11));
}
