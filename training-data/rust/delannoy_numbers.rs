fn central_delannoy(n: usize) -> u64 {
    let mut g = vec![vec![1u64; n + 1]; n + 1];
    for i in 1..=n {
        for j in 1..=n {
            g[i][j] = g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1];
        }
    }
    g[n][n]
}

fn main() {
    let v: Vec<u64> = (0..=5).map(central_delannoy).collect();
    println!("{:?}", v); // [1, 3, 13, 63, 321, 1683]
}
