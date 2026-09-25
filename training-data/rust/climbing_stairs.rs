fn ways(n: usize, steps: &[usize]) -> u128 {
    let mut dp = vec![0u128; n + 1];
    dp[0] = 1;
    for i in 1..=n {
        dp[i] = steps.iter().filter(|&&s| s <= i).map(|&s| dp[i - s]).sum();
    }
    dp[n]
}

fn min_cost(cost: &[u32]) -> u32 {
    let (a, b) = cost.iter().fold((0, 0), |(a, b), &c| (b, a.min(b) + c));
    a.min(b)
}

fn main() {
    println!("{:?}", (1..=10).map(|n| ways(n, &[1, 2])).collect::<Vec<_>>());
    println!("{} {}", ways(150, &[1, 2]), ways(10, &[1, 3, 5]));
    println!("{}", min_cost(&[1, 100, 1, 1, 1, 100, 1, 1, 100, 1]));
}
