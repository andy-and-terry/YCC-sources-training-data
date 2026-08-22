fn rotate(nums: &[i32], k: usize) -> Vec<i32> {
    let n = nums.len();
    let k = k % n;
    let mut result = vec![0; n];
    for (i, &x) in nums.iter().enumerate() {
        result[(i + k) % n] = x;
    }
    result
}

fn main() {
    println!("{:?}", rotate(&[1, 2, 3, 4, 5, 6, 7], 3));
}
