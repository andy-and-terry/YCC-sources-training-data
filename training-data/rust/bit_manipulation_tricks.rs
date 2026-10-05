fn is_power_of_two(n: u32) -> bool {
    n != 0 && n & (n - 1) == 0
}

fn single_number(nums: &[i32]) -> i32 {
    nums.iter().fold(0, |acc, &x| acc ^ x)
}

fn gray_code(n: u32) -> Vec<u32> {
    (0..1u32 << n).map(|i| i ^ (i >> 1)).collect()
}

fn main() {
    println!("{} {}", is_power_of_two(64), is_power_of_two(60));
    println!("{}", 0b1011_0000u8.trailing_zeros());
    println!("{} {}", 255u32.count_ones(), 1u32.leading_zeros());
    println!("{}", 40i32 & -40);
    println!("{}", single_number(&[4, 1, 2, 1, 2]));
    println!("{:?}", gray_code(3));
    println!("{:08b} {:#x}", 37u8.rotate_left(3), 255);
}
