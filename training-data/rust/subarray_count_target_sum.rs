// Count contiguous subarrays whose sum equals k (prefix sums + HashMap).
use std::collections::HashMap;

fn count_subarrays(nums: &[i32], k: i32) -> i32 {
    let mut seen: HashMap<i32, i32> = HashMap::from([(0, 1)]);
    let (mut total, mut count) = (0, 0);
    for &x in nums {
        total += x;
        count += seen.get(&(total - k)).copied().unwrap_or(0);
        *seen.entry(total).or_insert(0) += 1;
    }
    count
}

fn main() {
    println!("{}", count_subarrays(&[1, 1, 1], 2));
}
