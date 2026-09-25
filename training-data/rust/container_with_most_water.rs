fn max_area(h: &[u32]) -> (u32, usize, usize) {
    let (mut lo, mut hi) = (0, h.len() - 1);
    let mut best = (0, 0, 0);
    while lo < hi {
        let area = (hi - lo) as u32 * h[lo].min(h[hi]);
        if area > best.0 {
            best = (area, lo, hi);
        }
        if h[lo] < h[hi] { lo += 1 } else { hi -= 1 }
    }
    best
}

fn main() {
    let (area, l, r) = max_area(&[1, 8, 6, 2, 5, 4, 8, 3, 7]);
    println!("area {} between {} and {}", area, l, r);
}
