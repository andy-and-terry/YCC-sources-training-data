use std::cmp::Ordering;

fn pair_with_sum(nums: &[i32], target: i32) -> Option<(usize, usize)> {
    let (mut i, mut j) = (0, nums.len().checked_sub(1)?);
    while i < j {
        match (nums[i] + nums[j]).cmp(&target) {
            Ordering::Equal => return Some((i, j)),
            Ordering::Less => i += 1,
            Ordering::Greater => j -= 1,
        }
    }
    None
}

fn main() {
    println!("{:?}", pair_with_sum(&[1, 3, 4, 6, 8, 11], 10));
    println!("{:?}", pair_with_sum(&[1, 2, 3], 100));
}
