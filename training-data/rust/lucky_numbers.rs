fn lucky(limit: usize) -> Vec<usize> {
    let mut nums: Vec<usize> = (1..limit).step_by(2).collect();
    let mut i = 1;
    while i < nums.len() && nums[i] <= nums.len() {
        let step = nums[i];
        nums = nums
            .iter()
            .enumerate()
            .filter(|(idx, _)| (idx + 1) % step != 0)
            .map(|(_, &v)| v)
            .collect();
        i += 1;
    }
    nums
}

fn main() {
    let strs: Vec<String> = lucky(100).iter().map(|v| v.to_string()).collect();
    println!("{}", strs.join(" "));
}
