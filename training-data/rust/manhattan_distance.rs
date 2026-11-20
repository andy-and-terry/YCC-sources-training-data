// Manhattan distance via zip.
fn manhattan(a: &[i32], b: &[i32]) -> i32 {
    a.iter().zip(b).map(|(x, y)| (x - y).abs()).sum()
}

fn main() {
    println!("{}", manhattan(&[1, 2], &[4, 6]));
}
