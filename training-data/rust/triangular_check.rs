// n is triangular iff 8n + 1 is a perfect square.
fn is_triangular(n: u64) -> bool {
    let s = 8 * n + 1;
    let r = (s as f64).sqrt().round() as u64;
    r * r == s
}

fn main() {
    let v: Vec<String> = (0..=20u64)
        .filter(|&n| is_triangular(n))
        .map(|n| n.to_string())
        .collect();
    println!("{}", v.join(" "));
}
