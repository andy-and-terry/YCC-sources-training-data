fn majority_element(nums: &[i32]) -> i32 {
    let mut count = 0;
    let mut candidate = 0;
    for &num in nums {
        if count == 0 {
            candidate = num;
        }
        count += if num == candidate { 1 } else { -1 };
    }
    candidate
}

fn main() {
    println!("{}", majority_element(&[2, 2, 1, 1, 1, 2, 2]));
}
