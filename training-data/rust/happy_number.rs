use std::collections::HashSet;

fn digit_square_sum(mut n: u32) -> u32 {
    let mut s = 0;
    while n > 0 {
        s += (n % 10).pow(2);
        n /= 10;
    }
    s
}

fn is_happy(mut n: u32) -> bool {
    let mut seen = HashSet::new();
    while n != 1 && seen.insert(n) {
        n = digit_square_sum(n);
    }
    n == 1
}

fn main() {
    let happy: Vec<u32> = (1..=50).filter(|&n| is_happy(n)).collect();
    println!("{:?}", happy);
    println!("count up to 10000: {}", (1..=10000).filter(|&n| is_happy(n)).count());
}
