// Lattice paths with a rolling DP row.
fn lattice(n: usize) -> u64 {
    let mut row = vec![1u64; n + 1];
    for _ in 0..n {
        for j in 1..=n {
            row[j] += row[j - 1];
        }
    }
    row[n]
}

fn main() {
    println!("{}", lattice(3));
}
