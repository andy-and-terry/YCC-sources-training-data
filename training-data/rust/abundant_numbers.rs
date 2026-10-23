fn divisor_sum(n: u32) -> u32 {
    (1..n).filter(|d| n % d == 0).sum()
}

fn main() {
    let v: Vec<u32> = (1..60).filter(|&n| divisor_sum(n) > n).collect();
    println!("{:?}", v);
}
