fn radix_sort(mut nums: Vec<u32>) -> Vec<u32> {
    if nums.is_empty() {
        return nums;
    }
    let max = *nums.iter().max().unwrap();
    let mut exp: u64 = 1;
    while (max as u64) / exp > 0 {
        nums = bucket_by_digit(nums, exp);
        exp *= 10;
    }
    nums
}

fn bucket_by_digit(nums: Vec<u32>, exp: u64) -> Vec<u32> {
    let mut buckets: Vec<Vec<u32>> = vec![Vec::new(); 10];
    for n in nums {
        let digit = ((n as u64 / exp) % 10) as usize;
        buckets[digit].push(n);
    }
    buckets.into_iter().flatten().collect()
}

fn main() {
    let data = vec![170, 45, 75, 90, 802, 24, 2, 66];
    println!("{:?}", radix_sort(data));
}
