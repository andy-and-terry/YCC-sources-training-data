fn chebyshev(a: &[i32], b: &[i32]) -> i32 {
    a.iter().zip(b).map(|(x, y)| (x - y).abs()).max().unwrap_or(0)
}

fn main() {
    println!("{}", chebyshev(&[1, 2], &[4, 6]));
}
