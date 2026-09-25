/// Returns the maximum loot and which houses to rob.
fn rob(values: &[u32]) -> (u32, Vec<usize>) {
    let n = values.len();
    let mut best = vec![0u32; n + 2];
    for i in (0..n).rev() {
        best[i] = best[i + 1].max(values[i] + best[i + 2]);
    }
    let mut chosen = Vec::new();
    let mut i = 0;
    while i < n {
        if values[i] + best[i + 2] >= best[i + 1] {
            chosen.push(i);
            i += 2;
        } else {
            i += 1;
        }
    }
    (best[0], chosen)
}

fn main() {
    println!("{:?} {:?}", rob(&[2, 7, 9, 3, 1]), rob(&[5, 1, 1, 5]));
}
