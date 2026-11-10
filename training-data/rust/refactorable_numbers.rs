fn tau(n: u32) -> u32 {
    (1..=n).filter(|d| n % d == 0).count() as u32
}

fn main() {
    let v: Vec<u32> = (1..60).filter(|&n| n % tau(n) == 0).collect();
    println!("{:?}", v); // [1, 2, 8, 9, 12, 18, 24, 36, 40, 56]
}
