fn count_change_ways(coins: &[u32], amount: usize) -> u64 {
    let mut ways = vec![0u64; amount + 1];
    ways[0] = 1;
    for &coin in coins {
        let coin = coin as usize;
        for total in coin..=amount {
            ways[total] += ways[total - coin];
        }
    }
    ways[amount]
}

fn main() {
    println!("{}", count_change_ways(&[1, 2, 5], 5));
    println!("{}", count_change_ways(&[2, 5, 3, 6], 10));
}
