fn equilibrium_index(nums: &[i64]) -> Option<usize> {
    let total: i64 = nums.iter().sum();
    let mut left = 0;
    for (i, &v) in nums.iter().enumerate() {
        if left == total - left - v {
            return Some(i);
        }
        left += v;
    }
    None
}

fn main() {
    println!("{:?}", equilibrium_index(&[1, 7, 3, 6, 5, 6])); // Some(3)
    println!("{:?}", equilibrium_index(&[1, 2, 3])); // None
}
