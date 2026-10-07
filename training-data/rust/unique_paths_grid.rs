fn unique_paths(grid: &[Vec<u8>]) -> u64 {
    let mut dp = vec![0u64; grid[0].len()];
    dp[0] = u64::from(grid[0][0] == 0);
    for row in grid {
        for c in 0..row.len() {
            dp[c] = if row[c] == 1 { 0 } else { dp[c] + if c > 0 { dp[c - 1] } else { 0 } };
        }
    }
    *dp.last().unwrap()
}

fn main() {
    println!("{}", unique_paths(&vec![vec![0; 7]; 3]));
    println!("{}", unique_paths(&[vec![0, 0, 0], vec![0, 1, 0], vec![0, 0, 0]]));
    println!("{}", unique_paths(&vec![vec![0; 17]; 17]));
}
