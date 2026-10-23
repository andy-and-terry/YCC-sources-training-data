fn stirling2(n: usize, k: usize) -> u64 {
    let mut t = vec![vec![0u64; k + 1]; n + 1];
    t[0][0] = 1;
    for i in 1..=n {
        for j in 1..=k.min(i) {
            t[i][j] = j as u64 * t[i - 1][j] + t[i - 1][j - 1];
        }
    }
    t[n][k]
}

fn main() {
    println!("{} {}", stirling2(5, 2), stirling2(6, 3));
}
