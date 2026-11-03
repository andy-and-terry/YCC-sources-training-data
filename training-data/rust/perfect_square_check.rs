fn is_perfect_square(n: u64) -> bool {
    let r = (n as f64).sqrt() as u64;
    r * r == n || (r + 1) * (r + 1) == n
}

fn main() {
    let squares: Vec<u64> = (0..30).filter(|&n| is_perfect_square(n)).collect();
    println!("{:?}", squares);
}
