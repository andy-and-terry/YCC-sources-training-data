use std::collections::VecDeque;

fn max_sliding_window(nums: &[i32], k: usize) -> Vec<i32> {
    let mut dq: VecDeque<usize> = VecDeque::new();
    let mut result = vec![];
    for i in 0..nums.len() {
        while let Some(&back) = dq.back() {
            if nums[back] <= nums[i] {
                dq.pop_back();
            } else {
                break;
            }
        }
        dq.push_back(i);
        if *dq.front().unwrap() + k <= i {
            dq.pop_front();
        }
        if i + 1 >= k {
            result.push(nums[*dq.front().unwrap()]);
        }
    }
    result
}

fn main() {
    println!("{:?}", max_sliding_window(&[1, 3, -1, -3, 5, 3, 6, 7], 3));
}
