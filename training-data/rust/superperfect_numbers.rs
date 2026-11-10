fn sigma(n: u32) -> u32 {
    (1..=n).filter(|d| n % d == 0).sum()
}

fn main() {
    let v: Vec<u32> = (1..100).filter(|&n| sigma(sigma(n)) == 2 * n).collect();
    println!("{:?}", v); // [2, 4, 16, 64]
}
