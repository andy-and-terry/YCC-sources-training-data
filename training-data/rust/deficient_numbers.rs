fn sigma(n: u32) -> u32 {
    (1..=n).filter(|d| n % d == 0).sum()
}

fn main() {
    let v: Vec<u32> = (1..=20).filter(|&n| sigma(n) < 2 * n).collect();
    println!("{:?}", v);
}
