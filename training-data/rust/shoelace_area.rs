fn shoelace(pts: &[(f64, f64)]) -> f64 {
    let n = pts.len();
    let s: f64 = (0..n)
        .map(|i| {
            let (x1, y1) = pts[i];
            let (x2, y2) = pts[(i + 1) % n];
            x1 * y2 - x2 * y1
        })
        .sum();
    s.abs() / 2.0
}

fn main() {
    println!("{}", shoelace(&[(0.0, 0.0), (4.0, 0.0), (4.0, 3.0), (0.0, 3.0)]));
}
