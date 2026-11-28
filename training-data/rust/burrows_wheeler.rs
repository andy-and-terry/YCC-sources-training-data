fn bwt(s: &str) -> String {
    let b = s.as_bytes();
    let n = b.len();
    let mut idx: Vec<usize> = (0..n).collect();
    idx.sort_by(|&i, &j| (0..n).map(|k| b[(i + k) % n]).cmp((0..n).map(|k| b[(j + k) % n])));
    idx.iter().map(|&i| b[(i + n - 1) % n] as char).collect()
}

fn main() {
    println!("{}", bwt("banana$"));
}
