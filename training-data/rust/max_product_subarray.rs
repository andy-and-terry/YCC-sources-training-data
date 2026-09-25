fn max_product(a: &[i64]) -> i64 {
    let (mut best, mut hi, mut lo) = (a[0], a[0], a[0]);
    for &x in &a[1..] {
        if x < 0 {
            std::mem::swap(&mut hi, &mut lo);
        }
        hi = x.max(hi * x);
        lo = x.min(lo * x);
        best = best.max(hi);
    }
    best
}

fn main() {
    for a in [&[2, 3, -2, 4][..], &[-2, 0, -1], &[-2, 3, -4], &[1, -2, -3, 0, 7, -8, -2]] {
        println!("{:?} -> {}", a, max_product(a));
    }
}
