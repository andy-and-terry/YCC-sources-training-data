use std::collections::HashMap;

fn subarray_sum_count(nums: &[i64], k: i64) -> i64 {
    let mut counts: HashMap<i64, i64> = HashMap::new();
    counts.insert(0, 1);
    let mut running_sum = 0i64;
    let mut total = 0i64;
    for &num in nums {
        running_sum += num;
        total += counts.get(&(running_sum - k)).copied().unwrap_or(0);
        *counts.entry(running_sum).or_insert(0) += 1;
    }
    total
}

fn main() {
    println!("{}", subarray_sum_count(&[1, 1, 1], 2));
    println!("{}", subarray_sum_count(&[1, 2, 3], 3));
    println!("{}", subarray_sum_count(&[-1, -1, 1], 0));
}
