fn max_subarray(nums: &[i32]) -> i32 {
    let mut best = nums[0];
    let mut current = nums[0];
    for &x in &nums[1..] {
        current = x.max(current + x);
        best = best.max(current);
    }
    best
}

fn main() {
    println!("{}", max_subarray(&[-2, 1, -3, 4, -1, 2, 1, -5, 4]));
}
