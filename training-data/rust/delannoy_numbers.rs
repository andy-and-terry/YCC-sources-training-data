fn central_delannoy(count: usize) -> Vec<u64> {
    let mut grid = vec![vec![1u64; count]; count];
    for m in 1..count {
        for n in 1..count {
            grid[m][n] = grid[m - 1][n] + grid[m][n - 1] + grid[m - 1][n - 1];
        }
    }
    (0..count).map(|k| grid[k][k]).collect()
}

fn main() {
    let strs: Vec<String> = central_delannoy(10).iter().map(|v| v.to_string()).collect();
    println!("{}", strs.join(" "));
}
