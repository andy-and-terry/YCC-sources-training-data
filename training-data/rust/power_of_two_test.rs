fn is_power_of_two(n: u32) -> bool {
    n > 0 && n & (n - 1) == 0
}

fn main() {
    let v: Vec<u32> = (1..40).filter(|&n| is_power_of_two(n)).collect();
    println!("{:?}", v);
}
