fn is_harshad(n: u32) -> bool {
    let s: u32 = n.to_string().chars().map(|c| c.to_digit(10).unwrap()).sum();
    n > 0 && n % s == 0
}

fn main() {
    let v: Vec<u32> = (1..50).filter(|&n| is_harshad(n)).collect();
    println!("{:?}", v);
}
