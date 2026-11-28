use std::collections::HashSet;

fn is_happy(mut n: u32) -> bool {
    let mut seen = HashSet::new();
    while n != 1 && seen.insert(n) {
        n = n.to_string().chars().map(|c| c.to_digit(10).unwrap().pow(2)).sum();
    }
    n == 1
}

fn main() {
    let found: Vec<u32> = (1..).filter(|&n| is_happy(n)).take(8).collect();
    println!("{:?}", found); // [1, 7, 10, 13, 19, 23, 28, 31]
}
