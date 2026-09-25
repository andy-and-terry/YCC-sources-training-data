fn max_product(nums: &[i64]) -> i64 {
    let (mut best, mut hi, mut lo) = (nums[0], nums[0], nums[0]);
    for &x in &nums[1..] {
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
    println!("{} {} {}", max_product(&[2, 3, -2, 4]), max_product(&[-2, 0, -1]), max_product(&[-2, 3, -4]));
}
