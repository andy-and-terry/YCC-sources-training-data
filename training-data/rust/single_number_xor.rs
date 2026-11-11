fn single_number(nums: &[i32]) -> i32 {
    nums.iter().fold(0, |acc, n| acc ^ n)
}

fn main() {
    println!("{}", single_number(&[4, 1, 2, 1, 2])); // 4
}
