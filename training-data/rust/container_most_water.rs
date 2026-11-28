fn max_area(h: &[u32]) -> u32 {
    let (mut lo, mut hi, mut best) = (0, h.len() - 1, 0);
    while lo < hi {
        best = best.max(h[lo].min(h[hi]) * (hi - lo) as u32);
        if h[lo] < h[hi] {
            lo += 1;
        } else {
            hi -= 1;
        }
    }
    best
}

fn main() {
    println!("{}", max_area(&[1, 8, 6, 2, 5, 4, 8, 3, 7])); // 49
}
